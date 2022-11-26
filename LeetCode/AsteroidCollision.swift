//
//  AsteroidCollision.swift
//  https://leetcode.com/problems/asteroid-collision/
//
//  Created by Erik Radicheski da Silva on 26/11/22.
//

import XCTest

final class AsteroidCollision: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.asteroidCollision([5, 10, -5]), [5, 10])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.asteroidCollision([8, -8]), [])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.asteroidCollision([10, 2, -5]), [10])
    }
}

private class Solution {
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var asteroids = asteroids
        
        var size = 0
        
        while size != asteroids.count {
            size = asteroids.count
            
            var index = 0
            while index < asteroids.endIndex - 1 {
                if asteroids[index].signum() > asteroids[index + 1].signum() {
                    if abs(asteroids[index]) == abs(asteroids[index + 1]) {
                        asteroids.remove(at: index + 1)
                        asteroids.remove(at: index)
                    } else if abs(asteroids[index]) > abs(asteroids[index + 1]) {
                        asteroids.remove(at: index + 1)
                    } else {
                        asteroids.remove(at: index)
                    }
                }
                
                index += 1
            }
        }
        
        return asteroids
    }
}
