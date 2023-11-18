//
//  VacancyListCellModel.swift
//  VacanSearch
//
//  Created by Anastasiia Bugaeva on 14.11.2023.
//

import Foundation

struct VacanciesListResponse: Decodable {
    let items: [VacancyListCellModel]
}

struct VacancyListCellModel: Hashable, Decodable {
    let id: String
    let name: String
    let salary: SalaryModel?
    let employerName: String
    let employerLogo: String? // TODO: UIImage?
    let requirement: String?
    let responsibility: String?
    
    private enum CodingKeys: CodingKey {
        case id, name, salary, employer, snippet
    }
    
    private enum EmployerKeys: String, CodingKey {
        case employerName = "name"
        case logo_urls
        case employerLogo = "240"
        case employerOriginalLogo = "original"
    }
    
    private enum SnippetKeys: CodingKey {
        case requirement, responsibility
    }
    
    init(name: String, salary: SalaryModel?, employerName: String, employerLogo: String?, requirement: String?, responsibility: String?) {
        self.id = UUID().uuidString
        self.name = name
        self.salary = salary
        self.employerName = employerName
        self.employerLogo = employerLogo
        self.requirement = requirement
        self.responsibility = responsibility
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        salary = try container.decodeIfPresent(SalaryModel.self, forKey: .salary)
        
        let employerContainer = try container.nestedContainer(keyedBy: EmployerKeys.self, forKey: .employer)
        employerName = try employerContainer.decode(String.self, forKey: .employerName)
        
        if let logoContainer = try? employerContainer.nestedContainer(keyedBy: EmployerKeys.self, forKey: .logo_urls) {
            employerLogo = try logoContainer.decodeIfPresent(String.self, forKey: .employerLogo)
                ?? logoContainer.decodeIfPresent(String.self, forKey: .employerOriginalLogo)
        } else {
            employerLogo = nil
        }
        
        let snippetContainer = try container.nestedContainer(keyedBy: SnippetKeys.self, forKey: .snippet)
        requirement = try snippetContainer.decodeIfPresent(String.self, forKey: .requirement)
        responsibility = try snippetContainer.decodeIfPresent(String.self, forKey: .responsibility)
    }
}
