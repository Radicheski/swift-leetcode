//
//  FindAllPossibleRecipesFromGivenSupplies.swift
//  https://leetcode.com/problems/find-all-possible-recipes-from-given-supplies/
//
//  Created by Erik Radicheski da Silva on 21/03/25.
//

import XCTest

final class FindAllPossibleRecipesFromGivenSupplies: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findAllRecipes(["bread"], [["yeast", "flour"]], ["yeast", "flour", "corn"]), ["bread"])
    }
    
    func testExamplB() {
        XCTAssertEqual(solution.findAllRecipes(["bread", "sandwich"], [["yeast", "flour"], ["bread", "meat"]], ["yeast", "flour", "meat"]), ["bread", "sandwich"])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.findAllRecipes(["bread", "sandwich", "burger"], [["yeast", "flour"], ["bread", "meat"], ["sandwich", "meat", "bread"]], ["yeast", "flour", "meat"]), ["bread", "sandwich", "burger"])
    }
    
}

private class Solution {
    func findAllRecipes(_ recipes: [String], _ ingredients: [[String]], _ supplies: [String]) -> [String] {
        var available = Set(supplies)
        var recipeQueue = Array(recipes.indices)
        var createdRecipes = [String]()
        var lastSize = -1
        
        while available.count > lastSize {
            lastSize = available.count
            var queueSize = recipeQueue.count
            while queueSize > 0 {
                queueSize -= 1
                let recipeIndex = recipeQueue.removeFirst()
                var canCreate = true
                for ingredient in ingredients[recipeIndex] {
                    canCreate = canCreate && available.contains(ingredient)
                    guard canCreate else { break }
                }
                if canCreate {
                    available.insert(recipes[recipeIndex])
                    createdRecipes.append(recipes[recipeIndex])
                } else {
                    recipeQueue.append(recipeIndex)
                }
                
            }
        }
        
        
        return createdRecipes
    }
}
