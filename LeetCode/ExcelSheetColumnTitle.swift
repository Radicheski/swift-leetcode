//
//  ExcelSheetColumnTitle.swift
//  https://leetcode.com/problems/excel-sheet-column-title/
//
//  Created by Erik Radicheski da Silva on 22/08/23.
//

import XCTest

final class ExcelSheetColumnTitle: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.convertToTitle(1), "A")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.convertToTitle(28), "AB")
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.convertToTitle(701), "ZY")
    }
    
}

private class Solution {
    private let letters = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    
    
    func convertToTitle(_ columnNumber: Int) -> String {
        var number = columnNumber
        var answer = [Character]()
        
        repeat {
            number -= 1
            let index = number % 26
            answer.append(letters[index])
            
            number /= 26
        } while number > 0
        
        return String(answer.reversed())
    }
}
