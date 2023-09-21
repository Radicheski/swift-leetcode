//
//  MedianOfTwoSortedArrays.swift
//  https://leetcode.com/problems/median-of-two-sorted-arrays/
//
//  Created by Erik Radicheski da Silva on 21/09/23.
//

import XCTest

final class MedianOfTwoSortedArrays: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findMedianSortedArrays([1, 3], [2]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findMedianSortedArrays([1, 2], [3, 4]), 2.5)
    }

}

private class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let m = nums1.count
        let n = nums2.count
        
        if (m + n).isMultiple(of: 2) {
            let middle1 = findMedian(nums1, nums2, (m + n) / 2, 0, m - 1, 0, n - 1)
            let middle2 = findMedian(nums1, nums2, (m + n) / 2 - 1, 0, m - 1, 0, n - 1)
            return Double(middle1 + middle2) / 2
        } else {
            return Double(findMedian(nums1, nums2, (m + n) / 2, 0, m - 1, 0, n - 1))
        }
    }
    
    private func findMedian(_ nums1: [Int], _ nums2: [Int], _ k: Int, _ start1: Int,
                       _ end1: Int, _ start2: Int, _ end2: Int) -> Int {
        guard start1 <= end1 else { return nums2[k - start1] }
        guard start2 <= end2 else { return nums1[k - start2] }
        
        let middle1 = start1 + (end1 - start1) / 2
        let middle2 = start2 + (end2 - start2) / 2
        
        if middle1 + middle2 < k {
            if nums1[middle1] > nums2[middle2] {
                return findMedian(nums1, nums2, k, start1, end1, middle2 + 1, end2)
            } else {
                return findMedian(nums1, nums2, k, middle1 + 1, end1, start2, end2)
            }
        } else {
            if nums1[middle1] > nums2[middle2] {
                return findMedian(nums1, nums2, k, start1, middle1 - 1, start2, end2)
            } else {
                return findMedian(nums1, nums2, k, start1, end1, start2, middle2 - 1)
            }
        }
    }
}
