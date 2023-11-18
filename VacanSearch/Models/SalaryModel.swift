//
//  SalaryModel.swift
//  VacanSearch
//
//  Created by Anastasiia Bugaeva on 14.11.2023.
//

import Foundation

struct SalaryModel: Hashable, Decodable {
    let currency: String?
    let from: Int?
    let to: Int?
    let gross: Bool?
}
