//
//  CountNumberOfBalancedPermutations.swift
//  https://leetcode.com/problems/count-number-of-balanced-permutations/
//
//  Created by Erik Radicheski da Silva on 09/05/25.
//

import XCTest

final class CountNumberOfBalancedPermutations: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countBalancedPermutations("123"), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countBalancedPermutations("112"), 1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.countBalancedPermutations("12345"), 0)
    }
    
}

private class Solution {
    private let mod = 1_000_000_007

    func countBalancedPermutations(_ num: String) -> Int {
        var total = 0
        let n = num.count

        var count = Array(repeating: 0, count: 10)

        for c in num.compactMap(\.hexDigitValue) {
            count[c] += 1
            total += c
        }

        guard total.isMultiple(of: 2) else { return 0 }

        let target = total / 2
        let maxOdd = (n + 1) / 2
        var combinations = Array(repeating: Array(repeating: 0, count: maxOdd + 1), count: maxOdd + 1)
        var f = Array(repeating: Array(repeating: 0, count: maxOdd + 1), count: target + 1)

        for i in 0 ... maxOdd {
            combinations[i][i] = 1
            combinations[i][0] = 1

            guard i > 1 else { continue }

            for j in 1 ..< i {
                combinations[i][j] = (combinations[i - 1][j] + combinations[i - 1][j - 1]) % mod
            }
        }

        f[0][0] = 1
        var psum = 0
        var totalSum = 0

        for i in 0 ... 9 {
            psum += count[i]
            totalSum += i * count[i]

            for oddCount in stride(from: min(psum, maxOdd), through: max(0, psum + maxOdd - n), by: -1) {
                let evenCount = psum - oddCount
                
                for current in stride(from: min(totalSum, target), through: max(0, totalSum - target), by: -1) {
                    var result = 0
                    
                    for j in max(0, count[i] - evenCount) ... min(count[i], oddCount) where i * j <= current {
                        let ways = (combinations[oddCount][j] * combinations[evenCount][count[i] - j]) % mod
                        result += (ways * f[current  - i *  j][oddCount  - j]) % mod
                        result %= mod
                    }
                    
                    f[current][oddCount] = result % mod
                }
            }
        }
        
        return f[target][maxOdd]
    }
}
