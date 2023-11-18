//
//  VacanciesListViewController.swift
//  VacanSearch
//
//  Created by Anastasiia Bugaeva on 15.11.2023.
//

import UIKit

private enum Constants {
    static let rowHeight: CGFloat = 76
    static let cellIdentifier = "vacancyTableViewCell"
}

var vacanciesArr = [
    VacancyListCellModel(name: "Пусто",
                         salary: nil,
                         employerName: "employer",
                         employerLogo: nil,
                         requirement: nil,
                         responsibility: nil),
    VacancyListCellModel(name: "ЗП",
                         salary: SalaryModel(currency: "RUR", from: 20000, to: 50000, gross: true),
                         employerName: "employer",
                         employerLogo: nil,
                         requirement: nil,
                         responsibility: nil),
    VacancyListCellModel(name: "Требования",
                         salary: nil,
                         employerName: "employer",
                         employerLogo: nil,
                         requirement: "Надо просто спать",
                         responsibility: nil),
    VacancyListCellModel(name: "Обязанности",
                         salary: nil,
                         employerName: "employer",
                         employerLogo: nil,
                         requirement: nil,
                         responsibility: "Высыпаться"),
    VacancyListCellModel(name: "ЗП и Требования",
                         salary: SalaryModel(currency: "RUR", from: 20000, to: 50000, gross: true),
                         employerName: "employer",
                         employerLogo: nil,
                         requirement: "Надо просто спать",
                         responsibility: nil),
    VacancyListCellModel(name: "ЗП и Обязанности",
                         salary: SalaryModel(currency: "RUR", from: 20000, to: 50000, gross: true),
                         employerName: "employer",
                         employerLogo: nil,
                         requirement: nil,
                         responsibility: "Высыпаться"),
    VacancyListCellModel(name: "Требования и Обязанности",
                         salary: nil,
                         employerName: "employer",
                         employerLogo: nil,
                         requirement: "Надо просто спать",
                         responsibility: "Высыпаться"),
    VacancyListCellModel(name: "Полный комплект",
                         salary: SalaryModel(currency: "RUR", from: 20000, to: 50000, gross: true),
                         employerName: "employer",
                         employerLogo: nil,
                         requirement: "Надо просто спать",
                         responsibility: "Высыпаться"),
    VacancyListCellModel(name: "Пусто",
                         salary: nil,
                         employerName: "employer",
                         employerLogo: nil,
                         requirement: nil,
                         responsibility: nil),
    VacancyListCellModel(name: "ЗП",
                         salary: SalaryModel(currency: "RUR", from: 20000, to: 50000, gross: true),
                         employerName: "employer",
                         employerLogo: nil,
                         requirement: nil,
                         responsibility: nil),
    VacancyListCellModel(name: "Требования",
                         salary: nil,
                         employerName: "employer",
                         employerLogo: nil,
                         requirement: "Надо просто спать",
                         responsibility: nil),
    VacancyListCellModel(name: "Обязанности",
                         salary: nil,
                         employerName: "employer",
                         employerLogo: nil,
                         requirement: nil,
                         responsibility: "Высыпаться"),
    VacancyListCellModel(name: "ЗП и Требования",
                         salary: SalaryModel(currency: "RUR", from: 20000, to: 50000, gross: true),
                         employerName: "employer",
                         employerLogo: nil,
                         requirement: "Надо просто спать",
                         responsibility: nil),
    VacancyListCellModel(name: "ЗП и Обязанности",
                         salary: SalaryModel(currency: "RUR", from: 20000, to: 50000, gross: true),
                         employerName: "employer",
                         employerLogo: nil,
                         requirement: nil,
                         responsibility: "Высыпаться"),
    VacancyListCellModel(name: "Требования и Обязанности",
                         salary: nil,
                         employerName: "employer",
                         employerLogo: nil,
                         requirement: "Надо просто спать",
                         responsibility: "Высыпаться"),
    VacancyListCellModel(name: "Полный комплект",
                         salary: SalaryModel(currency: "RUR", from: 20000, to: 50000, gross: true),
                         employerName: "employer",
                         employerLogo: nil,
                         requirement: "Надо просто спать",
                         responsibility: "Высыпаться"),
    VacancyListCellModel(name: "Пусто",
                         salary: nil,
                         employerName: "employer",
                         employerLogo: nil,
                         requirement: nil,
                         responsibility: nil),
    VacancyListCellModel(name: "ЗП",
                         salary: SalaryModel(currency: "RUR", from: 20000, to: 50000, gross: true),
                         employerName: "employer",
                         employerLogo: nil,
                         requirement: nil,
                         responsibility: nil),
    VacancyListCellModel(name: "Требования",
                         salary: nil,
                         employerName: "employer",
                         employerLogo: nil,
                         requirement: "Надо просто спать",
                         responsibility: nil),
    VacancyListCellModel(name: "Обязанности",
                         salary: nil,
                         employerName: "employer",
                         employerLogo: nil,
                         requirement: nil,
                         responsibility: "Высыпаться"),
    VacancyListCellModel(name: "ЗП и Требования",
                         salary: SalaryModel(currency: "RUR", from: 20000, to: 50000, gross: true),
                         employerName: "employer",
                         employerLogo: nil,
                         requirement: "Надо просто спать",
                         responsibility: nil),
    VacancyListCellModel(name: "ЗП и Обязанности",
                         salary: SalaryModel(currency: "RUR", from: 20000, to: 50000, gross: true),
                         employerName: "employer",
                         employerLogo: nil,
                         requirement: nil,
                         responsibility: "Высыпаться"),
    VacancyListCellModel(name: "Требования и Обязанности",
                         salary: nil,
                         employerName: "employer",
                         employerLogo: nil,
                         requirement: "Надо просто спать",
                         responsibility: "Высыпаться"),
    VacancyListCellModel(name: "Полный комплект",
                         salary: SalaryModel(currency: "RUR", from: 20000, to: 50000, gross: true),
                         employerName: "employer",
                         employerLogo: nil,
                         requirement: "Надо просто спать",
                         responsibility: "Высыпаться"),
    VacancyListCellModel(name: "Пусто",
                         salary: nil,
                         employerName: "employer",
                         employerLogo: nil,
                         requirement: nil,
                         responsibility: nil),
    VacancyListCellModel(name: "ЗП",
                         salary: SalaryModel(currency: "RUR", from: 20000, to: 50000, gross: true),
                         employerName: "employer",
                         employerLogo: nil,
                         requirement: nil,
                         responsibility: nil),
    VacancyListCellModel(name: "Требования",
                         salary: nil,
                         employerName: "employer",
                         employerLogo: nil,
                         requirement: "Надо просто спать",
                         responsibility: nil),
    VacancyListCellModel(name: "Обязанности",
                         salary: nil,
                         employerName: "employer",
                         employerLogo: nil,
                         requirement: nil,
                         responsibility: "Высыпаться"),
    VacancyListCellModel(name: "ЗП и Требования",
                         salary: SalaryModel(currency: "RUR", from: 20000, to: 50000, gross: true),
                         employerName: "employer",
                         employerLogo: nil,
                         requirement: "Надо просто спать",
                         responsibility: nil),
    VacancyListCellModel(name: "ЗП и Обязанности",
                         salary: SalaryModel(currency: "RUR", from: 20000, to: 50000, gross: true),
                         employerName: "employer",
                         employerLogo: nil,
                         requirement: nil,
                         responsibility: "Высыпаться"),
    VacancyListCellModel(name: "Требования и Обязанности",
                         salary: nil,
                         employerName: "employer",
                         employerLogo: nil,
                         requirement: "Надо просто спать",
                         responsibility: "Высыпаться"),
    VacancyListCellModel(name: "Полный комплект",
                         salary: SalaryModel(currency: "RUR", from: 20000, to: 50000, gross: true),
                         employerName: "employer",
                         employerLogo: nil,
                         requirement: "Надо просто спать",
                         responsibility: "Высыпаться"),
]

class VacanciesListViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupDataSource(vacanciesArr)
    }
    
    // MARK: - Properties
    
    private lazy var vacanciesTableView = UITableView()
    private lazy var dataSource = VacanciesListDataSource(vacanciesTableView)
    
    private let refreshControl = UIRefreshControl()
    
    private var pageNumber = 0
    
    // MARK: - UI Elements
    
    
    
    // MARK: - Setup
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "VacanSearch"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.backButtonTitle = "Back"
        
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
        
        vacanciesTableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    
    // MARK: - Helpers
    
    func setupDataSource(_ vacancies: [VacancyListCellModel]) {
        var snapshot = dataSource.snapshot()
        
        snapshot.deleteAllItems()
        snapshot.appendSections([0])
        snapshot.appendItems(vacancies, toSection: 0)
        
        dataSource.apply(snapshot)
    }
    
    @objc private func refreshData() {
        defer {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                
                self.refreshControl.endRefreshing()
            }
        }
        
        guard let url = URL(string: "https://api.hh.ru/vacancies?per_page=100&page=\(pageNumber)&order_by=publication_time") else {
            print("url error")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let self else { return }
            
            guard error == nil, let data else {
                if let error { print("error:", error) }
                return
            }
            
            if let response = response as? HTTPURLResponse, response.statusCode == 400 {
                print("you can't look up more than 2000 items in the list")
                return
            }
            
            do {
                let vacanciesResponse = try JSONDecoder().decode(VacanciesListResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self.setupDataSource(vacanciesResponse.items)
                }
            } catch {
                print("decode error:", error.localizedDescription)
            }
            
            self.pageNumber += 1
        }.resume()
    }
}

// MARK: - Delegates

extension VacanciesListViewController: UITableViewDelegate {    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected row: \(indexPath)")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            tableView.deselectRow(at: indexPath, animated: true)
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
            
            return cell
        }
    }
}
