//
//  GroupThePeopleGivenTheGroupSizeTheyBelongTo.swift
//  https://leetcode.com/problems/group-the-people-given-the-group-size-they-belong-to/
//
//  Created by Erik Radicheski da Silva on 11/09/23.
//

import XCTest

final class GroupThePeopleGivenTheGroupSizeTheyBelongTo: XCTestCase {

    //TODO: Test cases
    
}

private class Solution {
    func groupThePeople(_ groupSizes: [Int]) -> [[Int]] {
        var groups = [Int: [Int]]()
        
        groupSizes.enumerated().forEach { groups[$0.element, default: []].append($0.offset) }
        
        return groups.flatMap { groupThePeople($0.value, $0.key) }
    }
    
    private func groupThePeople(_ people: [Int], _ groupSize: Int) -> [[Int]] {
        var answer = [[Int]]()
        
        for i in people.indices {
            if i % groupSize == 0 { answer.append([]) }
            
            answer[i / groupSize].append(people[i])
        }
        
        return answer
    }
}
