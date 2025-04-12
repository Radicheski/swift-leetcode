//
//  FindTheCountOfGoodIntegers.swift
//  https://leetcode.com/problems/find-the-count-of-good-integers/
//
//  Created by Erik Radicheski da Silva on 12/04/25.
//

import XCTest

final class FindTheCountOfGoodIntegers: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countGoodIntegers(3, 5), 27)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countGoodIntegers(1, 4), 2)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.countGoodIntegers(5, 6), 2468)
    }
    
}

private class Solution {
    func countGoodIntegers(_ n: Int, _ k: Int) -> Int {
        var dict = Set<String>()
        let base = Int(pow(10.0, Double((n - 1) / 2)))
        let skip = n % 2
        
        for i in base..<(base * 10) {
            var s = String(i)
            let reversed = String(s.reversed())
            s += reversed.dropFirst(skip)
            if let palindromicInteger = Int(s), palindromicInteger % Int(k) == 0 {
                let sorted = String(s.sorted())
                dict.insert(sorted)
            }
        }

        var factorial = [Int](repeating: 1, count: n + 1)
        for i in 1...n {
            factorial[i] = factorial[i - 1] * Int(i)
        }

        var ans = 0
        for s in dict {
            var cnt = [Int](repeating: 0, count: 10)
            for c in s {
                if let digit = c.wholeNumberValue {
                    cnt[digit] += 1
                }
            }
            
            let leadingDigitChoices = n - cnt[0]
            var tot = leadingDigitChoices * factorial[n - 1]
            for x in cnt {
                tot /= factorial[x]
            }
            ans += tot
        }

        return ans
    }
}
