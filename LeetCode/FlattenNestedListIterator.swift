//
//  FlattenNestedListIterator.swift
//  https://leetcode.com/problems/flatten-nested-list-iterator/
//
//  Created by Erik Radicheski da Silva on 18/01/23.
//

import XCTest

final class FlattenNestedListIterator: XCTestCase {

    // TODO: Test cases

}

private class NestedIterator {

    private var nestedList: [NestedInteger]

    init(_ nestedList: [NestedInteger]) {
        self.nestedList = nestedList.reversed()
    }

    func next() -> Int {
        guard hasNext() else { fatalError() }
        return nestedList.removeLast().getInteger()
    }

    func hasNext() -> Bool {
        while nestedList.isEmpty == false {
            if nestedList.last!.isInteger() == false {
                let last = nestedList.removeLast()
                nestedList.append(contentsOf: last.getList().reversed())
            } else {
                return true
            }
        }

        return false
    }
}

private protocol NestedInteger {
    func isInteger() -> Bool
    func getInteger() -> Int
    func setInteger(value: Int)
    func add(elem: NestedInteger)
    func getList() -> [NestedInteger]
}
