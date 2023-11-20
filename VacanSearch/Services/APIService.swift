//
//  APIService.swift
//  VacanSearch
//
//  Created by Anastasiia Bugaeva on 19.11.2023.
//

import Foundation
import Combine

class APIService: APIServiceProtocol {
    static let shared = APIService()
    
    private let urlSession = URLSession.shared
    private var pageNumber = 0
    private var queryString = ""

    func getVacancies(for query: String? = nil, needResetPageCounter: Bool = false) -> AnyPublisher<[VacancyListCellModel], Error> {
        pageNumber = needResetPageCounter ? 0 : pageNumber + 1
        if let query { queryString = query }
        
        return makeUrl(path: "https://api.hh.ru/vacancies?per_page=20&page=\(pageNumber)&text=\(queryString)&order_by=publication_time")
            .flatMap {
                let request = URLRequest(url: $0)
                return Just(request).setFailureType(to: Error.self)
            }
            .flatMap { self.urlSession.dataTaskPublisher(for: $0).mapError { $0 as Error } }
            .tryMap { try APIService.handleStatusCode($0) }
            .map(\.data)
            .decode(type: VacanciesListResponse.self, decoder: JSONDecoder())
            .map { $0.items }
            .eraseToAnyPublisher()
    }
    
    func getCompanyLogo(for logoUrl: String) -> AnyPublisher<Data, Error> {
        makeUrl(path: logoUrl)
            .flatMap {
                let request = URLRequest(url: $0)
                return Just(request).setFailureType(to: Error.self)
            }
            .flatMap { self.urlSession.dataTaskPublisher(for: $0).mapError { $0 as Error } }
            .tryMap { try APIService.handleStatusCode($0) }
            .map(\.data)
            .eraseToAnyPublisher()
    }
    
    private func makeUrl(path: String) -> AnyPublisher<URL, Error> {
        guard let url = URL(string: path) else {
            return Fail(error: NSError()).eraseToAnyPublisher()
        }
        
        return Just(url)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    private static func handleStatusCode(_ response: URLSession.DataTaskPublisher.Output) throws -> URLSession.DataTaskPublisher.Output {
        guard let httpResponse = response.response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        guard httpResponse.statusCode == 200 else {
            throw NSError()
        }
        
        return response
    }
}
