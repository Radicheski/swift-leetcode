//
//  KthLargestElementInAStream.swift
//  https://leetcode.com/problems/kth-largest-element-in-a-stream/
//
//  Created by Erik Radicheski da Silva on 23/05/23.
//

import XCTest

final class KthLargestElementInAStream: XCTestCase {
    
    func testExampleA() {
        let kthLargest = KthLargest(3, [4, 5, 8, 2])
        XCTAssertEqual(kthLargest.add(3), 4)
        XCTAssertEqual(kthLargest.add(5), 5)
        XCTAssertEqual(kthLargest.add(10), 5)
        XCTAssertEqual(kthLargest.add(9), 8)
        XCTAssertEqual(kthLargest.add(4), 8)
    }
    
}

private class KthLargest {
    
    private var k: Int
    private var nums: [Int]
    
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        self.nums = nums.sorted(by: >)
    }
    
    func add(_ val: Int) -> Int {
        if let index = nums.firstIndex(where: { $0 < val } ) {
            nums.insert(val, at: index)
        } else {
            nums.append(val)
        }
        
        return nums[k - 1]
    }
}
