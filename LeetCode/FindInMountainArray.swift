//
//  FindInMountainArray.swift
//  https://leetcode.com/problems/find-in-mountain-array/
//
//  Created by Erik Radicheski da Silva on 12/10/23.
//

import XCTest

protocol MountainArray {
    func get(_ index: Int) -> Int
    func length() -> Int
}

class Mountain: MountainArray {
    
    private let array: [Int]
    private(set) var calls = 0
    
    init(array: [Int]) {
        self.array = array
    }
    
    func get(_ index: Int) -> Int {
        calls += 1
        return array[index]
    }
    
    func length() -> Int {
        array.count
    }
}

final class FindInMountainArray: XCTestCase {
    
    private let solution = Solution()
 
    func testExampleA() {
        let array = Mountain(array: [1, 2, 3, 4, 5, 3, 1])
        XCTAssertEqual(solution.findInMountainArray(3, array), 2)
        XCTAssertLessThanOrEqual(array.calls, 100)
    }
    
    func testExampleB() {
        let array = Mountain(array: [0, 1, 2, 4, 2, 1])
        XCTAssertEqual(solution.findInMountainArray(3, array), -1)
        XCTAssertLessThanOrEqual(array.calls, 100)
    }

}

private class Solution {
    
    func findInMountainArray(_ target: Int, _ mountainArr: MountainArray) -> Int {
        let length = mountainArr.length()
        
        var left = 1
        var right = length - 2
        
        while left < right {
            let middle = left + (right - left) / 2
            
            if mountainArr.get(middle) < mountainArr.get(middle + 1) {
                left = middle + 1
            } else {
                right = middle
            }
        }
        let peakIndex = left
        
        left = 0
        right = peakIndex
        
        while left < right {
            let middle = left + (right - left) / 2
            
            if mountainArr.get(middle) < target {
                left = middle + 1
            } else {
                right = middle
            }
        }
        
        if mountainArr.get(left) == target {
            return left
        }
        
        left = peakIndex + 1
        right = length - 1
        
        while left < right {
            let middle = left + (right - left) / 2
            
            if mountainArr.get(middle) > target {
                left = middle + 1
            } else {
                right = middle
            }
        }
        
        return mountainArr.get(left) == target ? left : -1
    }
    
}
