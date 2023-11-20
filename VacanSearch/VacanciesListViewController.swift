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

var vacanciesArr = [
    VacancyListCellModel(name: "Пусто",
                         salary: nil,
                         employerName: "employer",
                         employerLogoUrl: nil,
                         requirement: nil,
                         responsibility: nil),
    VacancyListCellModel(name: "ЗП",
                         salary: SalaryModel(currency: "RUR", from: 20000, to: 50000, gross: true),
                         employerName: "employer",
                         employerLogoUrl: nil,
                         requirement: nil,
                         responsibility: nil),
    VacancyListCellModel(name: "Требования",
                         salary: nil,
                         employerName: "employer",
                         employerLogoUrl: nil,
                         requirement: "Надо просто спать",
                         responsibility: nil),
    VacancyListCellModel(name: "Обязанности",
                         salary: nil,
                         employerName: "employer",
                         employerLogoUrl: nil,
                         requirement: nil,
                         responsibility: "Высыпаться"),
    VacancyListCellModel(name: "ЗП и Требования",
                         salary: SalaryModel(currency: "RUR", from: 20000, to: 50000, gross: true),
                         employerName: "employer",
                         employerLogoUrl: nil,
                         requirement: "Надо просто спать",
                         responsibility: nil),
    VacancyListCellModel(name: "ЗП и Обязанности",
                         salary: SalaryModel(currency: "RUR", from: 20000, to: 50000, gross: true),
                         employerName: "employer",
                         employerLogoUrl: nil,
                         requirement: nil,
                         responsibility: "Высыпаться"),
    VacancyListCellModel(name: "Требования и Обязанности",
                         salary: nil,
                         employerName: "employer",
                         employerLogoUrl: nil,
                         requirement: "Надо просто спать",
                         responsibility: "Высыпаться"),
    VacancyListCellModel(name: "Полный комплект",
                         salary: SalaryModel(currency: "RUR", from: 20000, to: 50000, gross: true),
                         employerName: "employer",
                         employerLogoUrl: nil,
                         requirement: "Надо просто спать",
                         responsibility: "Высыпаться"),
    VacancyListCellModel(name: "Пусто",
                         salary: nil,
                         employerName: "employer",
                         employerLogoUrl: nil,
                         requirement: nil,
                         responsibility: nil),
    VacancyListCellModel(name: "ЗП",
                         salary: SalaryModel(currency: "RUR", from: 20000, to: 50000, gross: true),
                         employerName: "employer",
                         employerLogoUrl: nil,
                         requirement: nil,
                         responsibility: nil),
    VacancyListCellModel(name: "Требования",
                         salary: nil,
                         employerName: "employer",
                         employerLogoUrl: nil,
                         requirement: "Надо просто спать",
                         responsibility: nil),
    VacancyListCellModel(name: "Обязанности",
                         salary: nil,
                         employerName: "employer",
                         employerLogoUrl: nil,
                         requirement: nil,
                         responsibility: "Высыпаться"),
    VacancyListCellModel(name: "ЗП и Требования",
                         salary: SalaryModel(currency: "RUR", from: 20000, to: 50000, gross: true),
                         employerName: "employer",
                         employerLogoUrl: nil,
                         requirement: "Надо просто спать",
                         responsibility: nil),
    VacancyListCellModel(name: "ЗП и Обязанности",
                         salary: SalaryModel(currency: "RUR", from: 20000, to: 50000, gross: true),
                         employerName: "employer",
                         employerLogoUrl: nil,
                         requirement: nil,
                         responsibility: "Высыпаться"),
    VacancyListCellModel(name: "Требования и Обязанности",
                         salary: nil,
                         employerName: "employer",
                         employerLogoUrl: nil,
                         requirement: "Надо просто спать",
                         responsibility: "Высыпаться"),
    VacancyListCellModel(name: "Полный комплект",
                         salary: SalaryModel(currency: "RUR", from: 20000, to: 50000, gross: true),
                         employerName: "employer",
                         employerLogoUrl: nil,
                         requirement: "Надо просто спать",
                         responsibility: "Высыпаться"),
    VacancyListCellModel(name: "Пусто",
                         salary: nil,
                         employerName: "employer",
                         employerLogoUrl: nil,
                         requirement: nil,
                         responsibility: nil),
    VacancyListCellModel(name: "ЗП",
                         salary: SalaryModel(currency: "RUR", from: 20000, to: 50000, gross: true),
                         employerName: "employer",
                         employerLogoUrl: nil,
                         requirement: nil,
                         responsibility: nil),
    VacancyListCellModel(name: "Требования",
                         salary: nil,
                         employerName: "employer",
                         employerLogoUrl: nil,
                         requirement: "Надо просто спать",
                         responsibility: nil),
    VacancyListCellModel(name: "Обязанности",
                         salary: nil,
                         employerName: "employer",
                         employerLogoUrl: nil,
                         requirement: nil,
                         responsibility: "Высыпаться"),
    VacancyListCellModel(name: "ЗП и Требования",
                         salary: SalaryModel(currency: "RUR", from: 20000, to: 50000, gross: true),
                         employerName: "employer",
                         employerLogoUrl: nil,
                         requirement: "Надо просто спать",
                         responsibility: nil),
    VacancyListCellModel(name: "ЗП и Обязанности",
                         salary: SalaryModel(currency: "RUR", from: 20000, to: 50000, gross: true),
                         employerName: "employer",
                         employerLogoUrl: nil,
                         requirement: nil,
                         responsibility: "Высыпаться"),
    VacancyListCellModel(name: "Требования и Обязанности",
                         salary: nil,
                         employerName: "employer",
                         employerLogoUrl: nil,
                         requirement: "Надо просто спать",
                         responsibility: "Высыпаться"),
    VacancyListCellModel(name: "Полный комплект",
                         salary: SalaryModel(currency: "RUR", from: 20000, to: 50000, gross: true),
                         employerName: "employer",
                         employerLogoUrl: nil,
                         requirement: "Надо просто спать",
                         responsibility: "Высыпаться"),
    VacancyListCellModel(name: "Пусто",
                         salary: nil,
                         employerName: "employer",
                         employerLogoUrl: nil,
                         requirement: nil,
                         responsibility: nil),
    VacancyListCellModel(name: "ЗП",
                         salary: SalaryModel(currency: "RUR", from: 20000, to: 50000, gross: true),
                         employerName: "employer",
                         employerLogoUrl: nil,
                         requirement: nil,
                         responsibility: nil),
    VacancyListCellModel(name: "Требования",
                         salary: nil,
                         employerName: "employer",
                         employerLogoUrl: nil,
                         requirement: "Надо просто спать",
                         responsibility: nil),
    VacancyListCellModel(name: "Обязанности",
                         salary: nil,
                         employerName: "employer",
                         employerLogoUrl: nil,
                         requirement: nil,
                         responsibility: "Высыпаться"),
    VacancyListCellModel(name: "ЗП и Требования",
                         salary: SalaryModel(currency: "RUR", from: 20000, to: 50000, gross: true),
                         employerName: "employer",
                         employerLogoUrl: nil,
                         requirement: "Надо просто спать",
                         responsibility: nil),
    VacancyListCellModel(name: "ЗП и Обязанности",
                         salary: SalaryModel(currency: "RUR", from: 20000, to: 50000, gross: true),
                         employerName: "employer",
                         employerLogoUrl: nil,
                         requirement: nil,
                         responsibility: "Высыпаться"),
    VacancyListCellModel(name: "Требования и Обязанности",
                         salary: nil,
                         employerName: "employer",
                         employerLogoUrl: nil,
                         requirement: "Надо просто спать",
                         responsibility: "Высыпаться"),
    VacancyListCellModel(name: "Полный комплект",
                         salary: SalaryModel(currency: "RUR", from: 20000, to: 50000, gross: true),
                         employerName: "employer",
                         employerLogoUrl: nil,
                         requirement: "Надо просто спать",
                         responsibility: "Высыпаться"),
]

class VacanciesListViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupSearchController()
        setupDataSource(vacanciesArr)
    }
    
    // MARK: - Properties
    
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
        var snapshot = dataSource.snapshot()
        
        snapshot.deleteAllItems()
        snapshot.appendSections([0])
        snapshot.appendItems(vacancies, toSection: 0)
        
        dataSource.apply(snapshot)
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
