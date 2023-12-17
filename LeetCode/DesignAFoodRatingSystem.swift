//
//  DesignAFoodRatingSystem.swift
//  https://leetcode.com/problems/design-a-food-rating-system/
//
//  Created by Erik Radicheski da Silva on 17/12/23.
//

import XCTest

final class DesignAFoodRatingSystem: XCTestCase {

    func testExampleA() {
        let foodRatings = FoodRatings(["kimchi", "miso", "sushi", "moussaka", "ramen", "bulgogi"],
                                      ["korean", "japanese", "japanese", "greek", "japanese", "korean"],
                                      [9, 12, 8, 15, 14, 7])
        
        XCTAssertEqual(foodRatings.highestRated("korean"), "kimchi")
        XCTAssertEqual(foodRatings.highestRated("japanese"), "ramen")
        foodRatings.changeRating("sushi", 16)
        XCTAssertEqual(foodRatings.highestRated("japanese"), "sushi")
        foodRatings.changeRating("ramen", 16)
        XCTAssertEqual(foodRatings.highestRated("japanese"), "ramen")
    }

}

private class FoodRatings {
    
    private var foodRatingMap = [String?: Int]()
    private var foodCuisineMap = [String?: String]()
    private var cuisineFoodMap = [String?: [Food]]()

    init(_ foods: [String], _ cuisines: [String], _ ratings: [Int]) {
        for i in foods.indices {
            foodRatingMap[foods[i]] = ratings[i]
            foodCuisineMap[foods[i]] = cuisines[i]
            
            let newFood = Food(name: foods[i], rating: ratings[i])
            if let index = cuisineFoodMap[cuisines[i]]?.firstIndex(where: { newFood < $0 } ) {
                cuisineFoodMap[cuisines[i], default: []].insert(newFood, at: index)
            } else {
                cuisineFoodMap[cuisines[i], default: []].append(newFood)
            }
        }
    }
    
    func changeRating(_ food: String, _ newRating: Int) {
        foodRatingMap[food] = newRating
        let newFood = Food(name: food, rating: newRating)
        
        let cuisine = foodCuisineMap[food]
        if let index = cuisineFoodMap[cuisine]?.firstIndex(where: { newFood < $0 } ) {
            cuisineFoodMap[cuisine, default: []].insert(newFood, at: index)
        } else {
            cuisineFoodMap[cuisine, default: []].append(newFood)
        }
    }
    
    func highestRated(_ cuisine: String) -> String {
        var highestRated = cuisineFoodMap[cuisine]?.first
        
        while foodRatingMap[highestRated?.name] != highestRated?.rating {
            cuisineFoodMap[cuisine]?.removeFirst()
            highestRated = cuisineFoodMap[cuisine]?.first
        }
        
        return highestRated!.name
    }
}

fileprivate struct Food: Comparable {
    private(set) var name: String
    private(set) var rating: Int
    
    static func < (lhs: Food, rhs: Food) -> Bool {
        lhs.rating != rhs.rating ? lhs.rating > rhs.rating : lhs.name < rhs.name
    }
}
