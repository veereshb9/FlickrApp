//
//  URLResponse.swift
//  FlickrApp
//
//  Created by Veeresh on 6/27/24.
//

import Foundation

extension URLResponse {
    
    var responseStatusCode: Int? {
        (self as? HTTPURLResponse)?.statusCode
    }
    
    var isSuccess: Bool {
        guard let responseStatusCode else {return false}
        return responseStatusCode >= 200 && responseStatusCode < 300
    }
}
