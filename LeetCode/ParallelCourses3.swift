//
//  ParallelCourses3.swift
//  https://leetcode.com/problems/parallel-courses-iii/
//
//  Created by Erik Radicheski da Silva on 18/10/23.
//

import XCTest

final class ParallelCourses3: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minimumTime(3, [[1, 3], [2, 3]], [3, 2, 5]), 8)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minimumTime(5, [[1, 5], [2, 5], [3, 5], [3, 4], [4, 5]],
                                            [1, 2, 3, 4, 5]), 12)
    }

}

private class Solution {
    func minimumTime(_ n: Int, _ relations: [[Int]], _ time: [Int]) -> Int {
        var endTime = [Int: Int]()
        var answer = Int.min
        
        var preRequirements = [Int: [Int]]()
        
        for relation in relations {
            preRequirements[relation[1], default: []].append(relation[0])
        }
        
        for i in 1 ... n {
            answer = max(answer, minimumTime(i, time, preRequirements, &endTime))
        }
        
        return answer
    }
    
    private func minimumTime(_ i: Int, _ time: [Int], _ requirements: [Int: [Int]], _ endTime: inout [Int: Int]) -> Int {
        if let answer = endTime[i] {
            return answer
        }
        
        guard let requirement = requirements[i] else {
            endTime[i] = time[i - 1]
            return time[i - 1]
        }
        
        var answer = Int.min
        
        for req in requirement {
            answer = max(answer, minimumTime(req, time, requirements, &endTime))
        }
        
        answer += time[i - 1]
        
        endTime[i] = answer
        return answer
    }
}
