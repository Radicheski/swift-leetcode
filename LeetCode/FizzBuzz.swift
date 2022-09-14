//
//  FizzBuzz.swift
//  https://leetcode.com/problems/fizz-buzz/
//
//  Created by Erik Radicheski da Silva on 09/08/22.
//

import XCTest

class FizzBuzz: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(["1","2","Fizz"], solution.fizzBuzz(3))
    }
    
    func testExampleB() {
        XCTAssertEqual(["1","2","Fizz","4","Buzz"], solution.fizzBuzz(5))
    }
    
    func testExampleC() {
        XCTAssertEqual(["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14","FizzBuzz"], solution.fizzBuzz(15))
    }

}

private class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        var list = [String]()

        for number in 1...n {
            var answer = ""

            if number % 3 == 0 { answer += "Fizz" }
            if number % 5 == 0 { answer += "Buzz" }
            if answer.isEmpty { answer = "\(number)"}

            list.append(answer)
        }

        return list
    }
}
