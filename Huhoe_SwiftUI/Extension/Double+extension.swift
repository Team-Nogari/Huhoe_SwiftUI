//
//  Double+extension.swift
//  Huhoe_SwiftUI
//
//  Created by 황제하 on 2022/07/19.
//

import Foundation

extension Double {
    func toString(digit: Int = 0) -> String {
        return HuhoeNumberFormatter.shared.toString(number: self, digit: digit)
    }
}
