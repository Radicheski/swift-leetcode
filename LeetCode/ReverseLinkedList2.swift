//
//  ReverseLinkedList2.swift
//  https://leetcode.com/problems/reverse-linked-list-ii/
//
//  Created by Erik Radicheski da Silva on 07/09/23.
//

import XCTest

final class ReverseLinkedList2: XCTestCase {
    
    // TODO: Test cases
    
}

private class Solution {
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        guard let head = head else { return nil }
        var list = [head]
        
        while let next = list.last?.next {
            list.append(next)
        }
        
        var middle = [ListNode]()
        
        while middle.count < right - left + 1{
            middle.append(list.remove(at: left - 1))
        }
        
        middle.reverse()
        list.insert(contentsOf: middle, at: left - 1)
        
        for i in 1 ..< list.endIndex {
            list[i - 1].next = list[i]
        }
        
        list.last?.next = nil
        
        return list.first
    }
}
