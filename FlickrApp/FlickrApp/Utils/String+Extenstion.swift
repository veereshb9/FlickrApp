//
//  String+Extenstion.swift
//  FlickrApp
//
//  Created by Veeresh on 6/28/24.
//

import Foundation

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        return try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
    }
    
    var htmlToString: String {
        return htmlToAttributedString?.string ?? self
    }
}
