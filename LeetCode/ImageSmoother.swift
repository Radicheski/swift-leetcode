//
//  ImageSmoother.swift
//  https://leetcode.com/problems/image-smoother/
//
//  Created by Erik Radicheski da Silva on 13/02/23.
//

import XCTest

final class ImageSmoother: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.imageSmoother([[1, 1, 1],
                                               [1, 0, 1],
                                               [1, 1, 1]]),
                       [[0, 0, 0],
                        [0, 0, 0],
                        [0, 0, 0]])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.imageSmoother([[100, 200, 100],
                                               [200,  50, 200],
                                               [100, 200, 100]]),
                       [[137, 141, 137],
                        [141, 138, 141],
                        [137, 141, 137]])
    }

}

private class Solution {
    func imageSmoother(_ img: [[Int]]) -> [[Int]] {
        var result = img.map { $0.map { _ in 0 } }
        
        for x in img.indices {
            for y in img[x].indices {
                var sum = 0
                var count = 0
                
                for i in x - 1 ... x + 1 where img.indices.contains(i) {
                    for j in y - 1 ... y + 1 where img[i].indices.contains(j) {
                        sum += img[i][j]
                        count += 1
                    }
                }
                
                result[x][y] = sum / count
            }
        }
        
        return result
    }
}
