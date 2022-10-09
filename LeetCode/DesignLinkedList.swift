//
//  DesignLinkedList.swift
//  https://leetcode.com/problems/design-linked-list/
//
//  Created by Erik Radicheski da Silva on 09/10/22.
//

import XCTest

final class DesignLinkedList: XCTestCase {
    
    private var list = MyLinkedList()
    var array = [Int]()
    
    func testExampleA() {
        let commands = ["MyLinkedList", "addAtHead", "addAtTail", "addAtIndex", "get", "deleteAtIndex", "get"]
        let inputs = [[], [1], [3], [1, 2], [1], [1], [1]]
        let outputs = [nil, nil, nil, nil, 2, nil, 3]
        execute(commands, with: inputs, resultingIn: outputs)
    }
    
    func execute(_ commands: [String], with inputs: [[Int]], resultingIn outputs: [Int?]) {
        assert(commands.count == inputs.count)
        assert(inputs.count == outputs.count)
        
        var counter = 0
        
        for (index, command) in commands.enumerated() {
            
            switch command {
                
            case "MyLinkedList":
                createInstances()
                counter = 0
                
            case "get":
                XCTAssertEqual(list.get(inputs[index][0]), outputs[index]!)
                
            case "addAtHead":
                addAtHead(value: inputs[index])
                counter += 1
                XCTAssertEqual(list.size, counter)
                
            case "addAtTail":
                addAtTail(value: inputs[index])
                counter += 1
                XCTAssertEqual(list.size, counter)
                
            case "addAtIndex":
                addAtIndex(inputs[index])
                counter += 1
                XCTAssertEqual(list.size, counter)
                
            case "deleteAtIndex":
                delete(at: inputs[index])
                counter -= 1
                XCTAssertEqual(list.size, counter)
                
            default:
                XCTFail("Command \"\(command)\" not recognized.")
            }
            
            checkList()
        }
    }
    
    func checkList() {
        for (index, element) in array.enumerated() {
            XCTAssertEqual(element, list.get(index))
        }
    }
    
    func createInstances() {
        list = MyLinkedList()
        array = [Int]()
    }
    
    func addAtHead(value: [Int]) {
        assert(value.count == 1)
        list.addAtHead(value[0])
        array.insert(value[0], at: 0)
    }
    
    func addAtTail(value: [Int]) {
        assert(value.count == 1)
        list.addAtTail(value[0])
        array.append(value[0])
    }
    
    func addAtIndex(_ value: [Int]) {
        assert(value.count == 2)
        list.addAtIndex(value[0], value[1])
        array.insert(value[1], at: value[0])
    }
    
    func delete(at index: [Int]) {
        assert(index.count == 1)
        list.deleteAtIndex(index[0])
        array.remove(at: index[0])
    }
}

private class MyLinkedList {
    
    private(set) var size = 0
    private var head: MyLinkedList.Node? = nil
    private var tail: MyLinkedList.Node? = nil
    
    init() {
        
    }
    
    func get(_ index: Int) -> Int {
        guard (0 ..< size).contains(index) else { return -1 }
        
        if index == 0 {
            return head?.value ?? -1
        }
        
        if index == size - 1 {
            return tail?.value ?? -1
        }
        
        var node: MyLinkedList.Node? = head
        
        for _ in 1 ... index {
            node = node?.next
        }
        
        return node?.value ?? -1
    }
    
    func addAtHead(_ val: Int) {
        head = MyLinkedList.Node(value: val, next: head)
        if tail == nil { tail = head }
        size += 1
    }
    
    func addAtTail(_ val: Int) {
        let newTail = MyLinkedList.Node(value: val)
        tail?.next = newTail
        tail = newTail
        if head == nil { head = tail }
        size += 1
    }
    
    func addAtIndex(_ index: Int, _ val: Int) {
        guard (0 ... size).contains(index) else { return }
        
        if index == size {
            addAtTail(val)
            return
        }
        
        if index == 0 {
            addAtHead(val)
            return
        }
        
        var node = head
        
        for _ in 0 ..< index - 1 {
            node = node?.next
        }
        
        let newNode = MyLinkedList.Node(value: val, next: node?.next)
        node?.next = newNode
        size += 1
    }
    
    func deleteAtIndex(_ index: Int) {
        guard (0 ..< size).contains(index) else { return }
        
        if index == 0 {
            let oldHead = head
            head = oldHead?.next
            oldHead?.next = nil
            size -= 1
            return
        }
        
        var node = head
        
        for _ in 0 ..< index - 1 {
            node = node?.next
        }
        
        let oldNode = node?.next
        node?.next = oldNode?.next
        oldNode?.next = nil
        
        if oldNode === tail { tail = node }
        
        size -= 1
    }
    
    private class Node {
        var value: Int
        var next: Node?
        
        init(value: Int, next: Node? = nil) {
            self.value = value
            self.next = next
        }
    }
}
