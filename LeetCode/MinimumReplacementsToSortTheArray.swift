//
//  MinimumReplacementsToSortTheArray.swift
//  https://leetcode.com/problems/minimum-replacements-to-sort-the-array/
//
//  Created by Erik Radicheski da Silva on 30/08/23.
//

import XCTest

final class MinimumReplacementsToSortTheArray: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minimumReplacement([3, 9, 3]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minimumReplacement([1, 2, 3, 4, 5]), 0)
    }

}

private class Solution {
    func minimumReplacement(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return 0 }
        
        var nums = nums
        var answer = 0
        let n = nums.count
        
        for i in (0 ... n-2).reversed() {
            guard nums[i] > nums[i + 1] else { continue }
            
            let elementCount = (nums[i] + nums[i + 1] - 1) / nums[i + 1]
            
            answer += elementCount - 1
            
            nums[i] /= elementCount
        }
        
        return answer
    }
}
