//
//  HuhoeDateFormatter.swift
//  Huhoe_SwiftUI
//
//  Created by 황제하 on 2022/07/22.
//

import Foundation

final class HuhoeDateFormatter {
    static let shared = HuhoeDateFormatter()
    
    private init() { }
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter
    }()
    
    func toDate(str: String) -> Date {
        return dateFormatter.date(from: str) ?? Date()
    }
    
    func toTimeInterval(str: String) -> TimeInterval {
        return toDate(str: str).timeIntervalSince1970
    }
    
    func toDateString(timeInterval: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: timeInterval)
        
        return dateFormatter.string(from: date)
    }
    
    func toDateString(date: Date) -> String {
        return dateFormatter.string(from: date)
    }
}
