//
//  FindTheClosestPalindrome.swift
//  https://leetcode.com/problems/find-the-closest-palindrome/
//
//  Created by Erik Radicheski da Silva on 24/08/24.
//

import XCTest

final class FindTheClosestPalindrome: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.nearestPalindromic("123"), "121")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.nearestPalindromic("1"), "0")
    }
    
}

private class Solution {
    func nearestPalindromic(_ n: String) -> String {
        let number = Int(n)!
        let n = Array(n)
        let len = n.count
        let i = len % 2 == 0 ? len / 2 - 1 : len / 2
        let firstHalf = Int(String(n[0 ..< i + 1]))!
        
        var possibilities = [Int]()
        
        possibilities.append(halfToPalindrome(firstHalf, len.isMultiple(of: 2)))
        possibilities.append(halfToPalindrome(firstHalf + 1, len.isMultiple(of: 2)))
        possibilities.append(halfToPalindrome(firstHalf - 1, len.isMultiple(of: 2)))
        possibilities.append(Int("\(pow(10, len - 1))")! - 1)
        possibilities.append(Int("\(pow(10, len))")! + 1)
        
        var answer = Int.max
        var diff = Int.max
        
        for num in possibilities where num != number {
            if abs(num - number) < diff {
                diff = abs(num - number)
                answer = num
            } else if abs(num - number) == diff {
                answer = min(answer, num)
            }
        }
        
        return "\(answer)"
    }
    
    private func halfToPalindrome(_ left: Int, _ even: Bool) -> Int {
        var left = left
        var res = left
        
        if even == false { left /= 10 }
        
        while left > 0  {
            res *= 10
            res += left % 10
            left /= 10
        }
        
        return res
    }
}
