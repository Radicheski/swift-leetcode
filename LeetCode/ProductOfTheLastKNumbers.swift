//
//  ProductOfTheLastKNumbers.swift
//  https://leetcode.com/problems/product-of-the-last-k-numbers/
//
//  Created by Erik Radicheski da Silva on 14/02/25.
//

import XCTest

final class ProductOfTheLastKNumbers: XCTestCase {
}

private class ProductOfNumbers {
    
    var product = [1]
    var size = 0

    init() {
        
    }
    
    func add(_ num: Int) {
        if num == 0 {
            product = [1]
            size = 0
        } else {
            product.append(product.last! * num)
            size += 1
        }
    }
    
    func getProduct(_ k: Int) -> Int {
        guard k <= size else { return 0 }
        return product[size] / product[size - k]
    }
}
