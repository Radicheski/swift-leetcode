//
//  AddTwoNumbers2.swift
//  https://leetcode.com/problems/add-two-numbers-ii/
//
//  Created by Erik Radicheski da Silva on 15/01/23.
//

import XCTest

final class AddTwoNumbers2: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let l1 = ListNode.createLinkedList([7, 2, 4, 3])
        let l2 = ListNode.createLinkedList([5, 6, 4])
        let output = ListNode.createLinkedList([7, 8, 0, 7])
        XCTAssertEqual(solution.addTwoNumbers(l1, l2), output)
    }
    
    func testExampleB() {
        let l1 = ListNode.createLinkedList([2, 4, 3])
        let l2 = ListNode.createLinkedList([5, 6, 4])
        let output = ListNode.createLinkedList([8, 0, 7])
        XCTAssertEqual(solution.addTwoNumbers(l1, l2), output)
    }
    
    func testExampleC() {
        let l1 = ListNode.createLinkedList([0])
        let l2 = ListNode.createLinkedList([0])
        let output = ListNode.createLinkedList([0])
        XCTAssertEqual(solution.addTwoNumbers(l1, l2), output)
    }

}

private class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var numberOne = [Int]()
        var numberTwo = [Int]()
        
        var nodeOne = l1
        var nodeTwo = l2
        
        while nodeOne != nil || nodeTwo != nil {
            if let valueOne = nodeOne?.val {
                numberOne.append(valueOne)
            }
            
            if let valueTwo = nodeTwo?.val {
                numberTwo.append(valueTwo)
            }
            
            nodeOne = nodeOne?.next
            nodeTwo = nodeTwo?.next
        }
        
        let endIndex = max(numberOne.count, numberTwo.count)
        
        let offsetOne = endIndex - numberOne.count
        let offsetTwo = endIndex - numberTwo.count
        
        var result = [ListNode]()
        
        for i in 0 ..< endIndex {
            var value = 0
            
            value += i - offsetOne < 0 ? 0 : numberOne[i - offsetOne]
            value += i - offsetTwo < 0 ? 0 : numberTwo[i - offsetTwo]
            
            let newNode = ListNode(value)
            result.last?.next = newNode
            result.append(newNode)
            
            for j in (0 ..< result.endIndex).reversed() {
                guard result[j].val > 9 else { break }
                
                let carry = result[j].val / 10
                
                result[j].val %= 10
                
                if j == 0 {
                    let newNode = ListNode(carry)
                    newNode.next = result[0]
                    result.insert(newNode, at: 0)
                } else {
                    result[j - 1].val += carry
                }
            }
            
        }
        
        return result.first
    }
}
