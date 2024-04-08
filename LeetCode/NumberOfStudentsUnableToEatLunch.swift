//
//  NumberOfStudentsUnableToEatLunch.swift
//  https://leetcode.com/problems/number-of-students-unable-to-eat-lunch/=2024-04-08
//
//  Created by Erik Radicheski da Silva on 08/04/24.
//

import XCTest

final class NumberOfStudentsUnableToEatLunch: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countStudents([1, 1, 0, 0], [0, 1, 0, 1]), 0)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countStudents([1, 1, 1, 0, 0, 1], [1, 0, 0, 0, 1, 1]), 3)
    }
    
}

private class Solution {
    func countStudents(_ students: [Int], _ sandwiches: [Int]) -> Int {
        var students = students
        var sandwiches = sandwiches
        
        while students.isEmpty == false {
            let student = students.removeFirst()
            
            if student == sandwiches[0] {
                let _ = sandwiches.removeFirst()
            } else {
                students.append(student)
            }
            
            if students.allSatisfy( { $0 != sandwiches[0] } ) { break }
        }
        
        return students.count
    }
}
