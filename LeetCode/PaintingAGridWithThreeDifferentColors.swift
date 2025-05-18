//
//  PaintingAGridWithThreeDifferentColors.swift
//  https://leetcode.com/problems/painting-a-grid-with-three-different-colors/
//
//  Created by Erik Radicheski da Silva on 18/05/25.
//

import XCTest

final class PaintingAGridWithThreeDifferentColors: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.colorTheGrid(1, 1), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.colorTheGrid(1, 2), 6)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.colorTheGrid(5, 5), 580986)
    }
    
}

private class Solution {
    private let mod = 1_000_000_007
    
    func colorTheGrid(_ m: Int, _ n: Int) -> Int {
        var valid = [Int: [Int]]()
        let maskEnd = Int(pow(3, Double(m)))
        for mask in 0 ..< maskEnd {
            var color = [Int]()
            var mm = mask
            for _ in 0 ..< m {
                color.append(mm % 3)
                mm /= 3
            }
            var check = true
            for i in 0 ..< m - 1 {
                if color[i] == color[i + 1] {
                    check = false
                    break
                }
            }
            if check {
                valid[mask] = color
            }
        }
        
        var adjacent = [Int: [Int]]()
        for mask1 in valid.keys {
            for mask2 in valid.keys {
                var check = true
                for i in 0 ..< m {
                    if valid[mask1]?[i] == valid[mask2]?[i] {
                        check = false
                        break
                    }
                }
                if check {
                    adjacent[mask1, default: []].append(mask2)
                }
            }
        }
        
        var f = [Int: Int]()
        for mask in valid.keys {
            f[mask] = 1
        }
        for _ in 1 ..< n {
            var g = [Int: Int]()
            for mask2 in valid.keys {
                for mask1 in adjacent[mask2, default: []] {
                    g[mask2] = g[mask2, default: 0] + f[mask1, default: 0] % mod
                }
            }
            f = g
        }
        
        var answer = 0
        for num in f.values {
            answer += num
            answer %= mod
        }
        
        return answer
    }
}
