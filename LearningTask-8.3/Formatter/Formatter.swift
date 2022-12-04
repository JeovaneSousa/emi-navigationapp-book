//
//  Formatter.swift
//  LearningTask-8.3
//
//  Created by jeovane.barbosa on 02/12/22.
//

import Foundation


class StringToDecimalFormatter {
    
    static func convertToBrCurrency(theDecimal decilmalNumber: Decimal) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        
        return formatter.string(from: decilmalNumber as NSDecimalNumber)!
    }
}

extension Decimal {
    
    var convertToStringBrCurrency: String {
        return StringToDecimalFormatter.convertToBrCurrency(theDecimal: self)
    }
}
