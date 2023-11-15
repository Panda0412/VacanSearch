//
//  VacancyListCellModel.swift
//  VacanSearch
//
//  Created by Anastasiia Bugaeva on 14.11.2023.
//

import Foundation

struct VacancyListCellModel {
    let id: String
    let name: String
    let salary: SalaryModel?
    let employerName: String
    let employerLogo: String // TODO: UIImage?
    let requirement: String?
    let responsibility: String?
}
