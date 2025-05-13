//
//  TotalCharactersInStringAfterTransformationsII.swift
//  https://leetcode.com/problems/total-characters-in-string-after-transformations-ii/
//
//  Created by Erik Radicheski da Silva on 14/05/25.
//

import XCTest

final class TotalCharactersInStringAfterTransformationsII: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.lengthAfterTransformations("abcyy", 2, [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2]), 7)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.lengthAfterTransformations("azbk", 1, [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2]), 8)
    }
    
}

private class Solution {
    private static let MOD = Int(1e9) + 7
    private static let L = 26

    private class Mat {
        var a: [[Int]] = Array(repeating: Array(repeating: 0, count: L), count: L)

        init() {}

        init(copyFrom: Mat) {
            for i in 0..<Solution.L {
                for j in 0..<Solution.L {
                    self.a[i][j] = copyFrom.a[i][j]
                }
            }
        }

        func mul(_ other: Mat) -> Mat {
            let result = Mat()
            for i in 0..<Solution.L {
                for j in 0..<Solution.L {
                    var sum: Int = 0
                    for k in 0..<Solution.L {
                        sum = (sum + (a[i][k] * other.a[k][j]) % Solution.MOD) % Solution.MOD
                    }
                    result.a[i][j] = sum
                }
            }
            return result
        }
    }

    private func identityMatrix() -> Mat {
        let m = Mat()
        for i in 0..<Solution.L {
            m.a[i][i] = 1
        }
        return m
    }

    private func quickmul(_ x: Mat, _ y: Int) -> Mat {
        var ans = identityMatrix()
        var cur = Mat(copyFrom: x)
        var y = y
        while y > 0 {
            if y % 2 == 1 {
                ans = ans.mul(cur)
            }
            cur = cur.mul(cur)
            y >>= 1
        }
        return ans
    }

    func lengthAfterTransformations(_ s: String, _ t: Int, _ nums: [Int]) -> Int {
        let T = Mat()
        for i in 0..<Solution.L {
            for j in 1...nums[i] {
                T.a[(i + j) % Solution.L][i] = 1
            }
        }

        let res = quickmul(T, t)
        var f = [Int](repeating: 0, count: Solution.L)
        for ch in s {
            if let ascii = ch.asciiValue {
                f[Int(ascii - Character("a").asciiValue!)] += 1
            }
        }

        var ans = 0
        for i in 0..<Solution.L {
            for j in 0..<Solution.L {
                ans = (ans + res.a[i][j] * f[j]) % Solution.MOD
            }
        }
        return ans
    }
}
