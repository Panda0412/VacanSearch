//
//  Currency.swift
//  VacanSearch
//
//  Created by Anastasiia Bugaeva on 17.11.2023.
//

import Foundation

enum Currency: String {
    case AZN, BYR, EUR, GEL, KGS, KZT, RUR, UAH, USD, UZS
    
    func getSymbol() -> String {
        switch self {
            case .AZN: "₼"
            case .BYR: "Br"
            case .EUR: "€"
            case .GEL: "₾"
            case .KGS: "сом"
            case .KZT: "₸"
            case .RUR: "₽"
            case .UAH: "₴"
            case .USD: "$"
            case .UZS: "so'm"
        }
    }
}

//let arr = [
//    {"code":"AZN","abbr":"₼","name":"Манаты","default":false,"rate":0.019113,"in_use":false},
//    {"code":"BYR","abbr":"Br","name":"Белорусские рубли","default":false,"rate":0.03489,"in_use":false},
//    {"code":"EUR","abbr":"€","name":"Евро","default":false,"rate":0.010353,"in_use":true},
//    {"code":"GEL","abbr":"₾","name":"Грузинский лари","default":false,"rate":0.030364,"in_use":false},
//    {"code":"KGS","abbr":"сом","name":"Кыргызский сом","default":false,"rate":1.003666,"in_use":false},
//    {"code":"KZT","abbr":"₸","name":"Тенге","default":false,"rate":5.188848,"in_use":false},
//    {"code":"RUR","abbr":"₽","name":"Рубли","default":true,"rate":1.0,"in_use":true},
//    {"code":"UAH","abbr":"₴","name":"Гривны","default":false,"rate":0.407709,"in_use":false},
//    {"code":"USD","abbr":"$","name":"Доллары","default":false,"rate":0.011243,"in_use":true},
//    {"code":"UZS","abbr":"so'm","name":"Узбекский сум","default":false,"rate":138.08283,"in_use":false}
//]
