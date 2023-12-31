//
//  APIServiceProtocol.swift
//  VacanSearch
//
//  Created by Anastasiia Bugaeva on 19.11.2023.
//

import Foundation
import Combine

protocol APIServiceProtocol {
    func getVacancies(for: String?, needResetPageCounter: Bool) -> AnyPublisher<[VacancyListCellModel], Error>
    func getCompanyLogo(for: String) -> AnyPublisher<Data, Error>
}
