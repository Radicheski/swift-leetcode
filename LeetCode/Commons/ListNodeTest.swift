//
//  ListNodeTest.swift
//
//  Created by Erik Radicheski da Silva on 12/09/22.
//

import XCTest

class ListNodeTest: XCTestCase {
    
    // MARK: Lists are equal

    func testListsAreEqual() {
        let listA = ListNode.createLinkedList([1, 2, 3])
        let listB = ListNode.createLinkedList([1, 2, 3])
        
        XCTAssertTrue(ListNode.isEqual(listA, listB))
    }
    
    // MARK: Lists have different sizes
    
    func testListAIsLonger() {
        let listA = ListNode.createLinkedList([1, 2, 3])
        let listB = ListNode.createLinkedList([1, 2])
        
        XCTAssertFalse(ListNode.isEqual(listA, listB))
    }
    
    func testListBIsLonger() {
        let listA = ListNode.createLinkedList([1, 2])
        let listB = ListNode.createLinkedList([1, 2, 3])
        
        XCTAssertFalse(ListNode.isEqual(listA, listB))
    }
    
    // MARK: Lists have same size but different elements/order
    
    func testListsAreDifferent() {
        let listA = ListNode.createLinkedList([1, 2, 3])
        let listB = ListNode.createLinkedList([4, 5, 6])
        
        XCTAssertFalse(ListNode.isEqual(listA, listB))
    }
    
    func testListsHaveDifferentOrder() {
        let listA = ListNode.createLinkedList([1, 2, 3])
        let listB = ListNode.createLinkedList([1, 3, 2])
        
        XCTAssertFalse(ListNode.isEqual(listA, listB))
    }
    
    // MARK: Only one list has cycle
    
    func testListAHasCycle() {
        let listA = ListNode.createTestCase([3, 2, 0, -4], 1).head
        let listB = ListNode.createLinkedList([3, 2, 0, -4, 2, 0, 4])
        
        XCTAssertFalse(ListNode.isEqual(listA, listB))
    }
    
    func testListBHasCycle() {
        let listA = ListNode.createLinkedList([3, 2, 0, -4, 2, 0, 4])
        let listB = ListNode.createTestCase([3, 2, 0, -4], 1).head
        
        XCTAssertFalse(ListNode.isEqual(listA, listB))
    }
    
    // MARK: Both lists have cycles
    
    func testBothListsHaveSameCycle() {
        let listA = ListNode.createTestCase([3, 2, 0, -4], 1).head
        let listB = ListNode.createTestCase([3, 2, 0, -4], 1).head
        
        XCTAssertTrue(ListNode.isEqual(listA, listB))
    }
    
    func testCycleAStartsEarlier() {
        let listA = ListNode.createTestCase([3, 2, 0, -4], 1).head
        let listB = ListNode.createTestCase([3, 2, 0, -4], 2).head
        
        XCTAssertFalse(ListNode.isEqual(listA, listB))
    }
    
    func testCycleBStartsEarlier() {
        let listA = ListNode.createTestCase([3, 2, 0, -4], 2).head
        let listB = ListNode.createTestCase([3, 2, 0, -4], 1).head
        
        XCTAssertFalse(ListNode.isEqual(listA, listB))
    }
    
    func testListAHasShorterCycle() {
        let listA = ListNode.createTestCase([3, 2, 0], 1).head
        let listB = ListNode.createTestCase([3, 2, 0, -4], 1).head
        
        XCTAssertFalse(ListNode.isEqual(listA, listB))
    }
    
    func testListBHasShorterCycle() {
        let listA = ListNode.createTestCase([3, 2, 0, -4], 1).head
        let listB = ListNode.createTestCase([3, 2, 0], 1).head
        
        XCTAssertFalse(ListNode.isEqual(listA, listB))
    }

}
