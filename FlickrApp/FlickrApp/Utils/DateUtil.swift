//
//  DateUtil.swift
//  FlickrApp
//
//  Created by Veeresh on 6/28/24.
//

import Foundation

struct DateUtil {
    static func convertDateString(dateString: String) -> String {
        let inputFormatter = ISO8601DateFormatter()
        guard let date = inputFormatter.date(from: dateString) else{
            print("Failed to parse date")
            return ""
        }
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateStyle = .medium
        outputFormatter.timeStyle = .short
        return outputFormatter.string(from: date)
    }
}
