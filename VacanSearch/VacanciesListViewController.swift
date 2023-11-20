//
//  VacanciesListViewController.swift
//  VacanSearch
//
//  Created by Anastasiia Bugaeva on 15.11.2023.
//

import UIKit
import Combine

private enum Constants {
    static let rowHeight: CGFloat = 76
    static let cellIdentifier = "vacancyTableViewCell"
}

class VacanciesListViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupSearchController()
        setupDataSource(vacancies)
    }
    
    // MARK: - Properties
    
    private lazy var noDataPlaceholder: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 21)
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Введите в поиск название и появится список вакансий"
        
        return label
    }()
    
    private var vacancies = [VacancyListCellModel]()
    private var isUpdating = false
    private var pageNumber = 0
    
    private lazy var vacanciesTableView = UITableView()
    private lazy var dataSource = VacanciesListDataSource(vacanciesTableView)
    
    private var cancellable = [AnyCancellable]()
    
    // MARK: - Setup
    
    private func setupSearchController() {
        let searchController = UISearchController()
        
        searchController.searchBar.placeholder = "Введите название вакансии"
        
        navigationItem.searchController = searchController
        
        NotificationCenter.default.publisher(for: UISearchTextField.textDidChangeNotification, object: searchController.searchBar.searchTextField)
            .map {
                ($0.object as! UISearchTextField).text ?? ""
            }
            .filter { $0.trimmingCharacters(in: .whitespaces).count >= 3 }
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .sink { result in
                switch result {
                    case .finished: break
                    case .failure(let error):
                        print(error)
                }
            } receiveValue: { [weak self] searchText in
                guard let self else { return }
                noDataPlaceholder.text = "Вакансий не найдено :с"
                self.getVacancies(isNewSearch: true, query: searchText)
            }
            .store(in: &cancellable)
    }
    
    private func setupUI() {
        navigationItem.title = "VacanSearch"
        navigationItem.backButtonTitle = "Back"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        vacanciesTableView.backgroundColor = .systemGroupedBackground
        
        vacanciesTableView.translatesAutoresizingMaskIntoConstraints = false
        vacanciesTableView.showsVerticalScrollIndicator = false
        vacanciesTableView.separatorStyle = .none
        vacanciesTableView.rowHeight = UITableView.automaticDimension
        vacanciesTableView.estimatedRowHeight = 350
        
        view.addSubview(vacanciesTableView)
        
        NSLayoutConstraint.activate([
            vacanciesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            vacanciesTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            vacanciesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            vacanciesTableView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
        
        vacanciesTableView.register(VacanciesListTableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
        vacanciesTableView.delegate = self
    }
    
    // MARK: - Helpers
    
    func setupDataSource(_ vacancies: [VacancyListCellModel]) {
        guard !vacancies.isEmpty else {
            setNoDataPlaceholder()
            return
        }
        
        removeNoDataPlaceholder()
        
        var snapshot = dataSource.snapshot()
        
        snapshot.deleteAllItems()
        snapshot.appendSections([0])
        snapshot.appendItems(vacancies, toSection: 0)
        
        dataSource.apply(snapshot)
    }
    
    func setNoDataPlaceholder() {
        vacanciesTableView.isScrollEnabled = false
        view.addSubview(noDataPlaceholder)
        
        noDataPlaceholder.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            noDataPlaceholder.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            noDataPlaceholder.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            noDataPlaceholder.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ])
    }
    
    func removeNoDataPlaceholder() {
        noDataPlaceholder.removeFromSuperview()
        vacanciesTableView.isScrollEnabled = true
    }
    
    private func getVacancies(isNewSearch: Bool, query: String? = nil) {
        isUpdating = true
        APIService.shared.getVacancies(for: query, needResetPageCounter: isNewSearch)
            .subscribe(on: DispatchQueue.global(qos: .userInitiated))
            .receive(on: DispatchQueue.main)
            .sink { result in
                switch result {
                    case .finished: break
                    case .failure(let error):
                        print(error)
                }
            } receiveValue: { vacancies in
                if isNewSearch {
                    self.vacancies = vacancies
                } else {
                    for vacancy in vacancies {
                        if !self.vacancies.contains(vacancy) {
                            self.vacancies.append(vacancy)
                        }
                    }
                }
                
                self.isUpdating = false
                self.setupDataSource(self.vacancies)
            }
            .store(in: &cancellable)
    }
}

// MARK: - Delegates

extension VacanciesListViewController: UITableViewDelegate {    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? VacanciesListTableViewCell
        cell?.setSelected()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            cell?.deselect()
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == vacancies.count - 6 && !isUpdating {
            getVacancies(isNewSearch: false)
        }
    }
}

// MARK: - Data source

final class VacanciesListDataSource: UITableViewDiffableDataSource<Int, VacancyListCellModel> {
    init(_ tableView: UITableView) {
        super.init(tableView: tableView) { tableView, indexPath, itemIdentifier in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as? VacanciesListTableViewCell else {
                return UITableViewCell()
            }
            
            cell.configure(with: itemIdentifier)
            
            if itemIdentifier.employerLogoImage != nil || itemIdentifier.employerLogoUrl == nil {
                return cell
            }
            
            if let logoUrlString = itemIdentifier.employerLogoUrl {
                let _ = APIService.shared.getCompanyLogo(for: logoUrlString)
                    .subscribe(on: DispatchQueue.global(qos: .userInitiated))
                    .receive(on: DispatchQueue.main)
                    .sink { result in
                        switch result {
                            case .finished: break
                            case .failure(let error):
                                print(error)
                        }
                    } receiveValue: { logo in
                        var model = itemIdentifier
                        model.employerLogoImage = UIImage(data: logo)
                        cell.configure(with: model)
                    }
            }
            
            return cell
        }
    }
}
