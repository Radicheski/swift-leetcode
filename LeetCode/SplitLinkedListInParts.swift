//
//  SplitLinkedListInParts.swift
//  https://leetcode.com/problems/split-linked-list-in-parts/
//
//  Created by Erik Radicheski da Silva on 06/09/23.
//

import XCTest

final class SplitLinkedListInParts: XCTestCase {

    // TODO: Test cases

}

private class Solution {
    func splitListToParts(_ head: ListNode?, _ k: Int) -> [ListNode?] {
        var current = head
        var count = 0
        
        while current != nil {
            count += 1
            current = current?.next
        }
        
        var answer: [ListNode?] = Array(repeating: nil, count: k)
        let (size, remainder) = count.quotientAndRemainder(dividingBy: k)
        
        current = head
        for i in 0 ..< k {
            answer[i] = current
            
            for _ in stride(from: 0, to: size + (i < remainder ? 1 : 0) - 1, by: 1) {
                current = current?.next
            }
            
            if let previousTail = current {
                current = current?.next
                previousTail.next = nil
            }

        }
        
        return answer
    }
}
