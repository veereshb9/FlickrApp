//
//  DateUtils_Tests.swift
//  FlickrAppTests
//
//  Created by Veeresh on 6/28/24.
//

import XCTest
@testable import FlickrApp

final class DateUtil_Tests: XCTestCase {

func testConvertDateString() {
        let dateString = "2024-06-27T06:01:34Z"
        let expectedOutput = "Jun 27, 2024 at 1:01 AM"
        
        let result = DateUtil.convertDateString(dateString: dateString)
        XCTAssertEqual(result, expectedOutput, "Date conversion did not produce the expected output")
    }
    
func testConvertInvalidDateString() {
        let invalidDateString = "2024-06-27" // Invalid format without time
        let result = DateUtil.convertDateString(dateString: invalidDateString)
        XCTAssertEqual(result, "", "Invalid date string should return an empty string")
    }
    
}
