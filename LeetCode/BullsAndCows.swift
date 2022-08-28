//
//  BullsAndCows.swift
//  https://leetcode.com/problems/bulls-and-cows/
//
//  Created by Erik Radicheski da Silva on 28/08/22.
//

import XCTest

class BullsAndCows: XCTestCase {

    func test() {
        let solution = Solution()
        
        
        XCTAssertEqual(solution.getHint("1807", "7810"), "1A3B")
        XCTAssertEqual(solution.getHint("1123", "0111"), "1A1B")
    }
}

private class Solution {
    func getHint(_ secret: String, _ guess: String) -> String {
        let secret = Array(secret)
        let guess = Array(guess)
        
        var bulls = 0
        var cowSecret = [String.Element]()
        var cowGuess = [String.Element]()
        
        for index in 0 ..< secret.count {
            if secret[index] == guess[index] {
                bulls += 1
            } else {
                cowSecret.append(secret[index])
                cowGuess.append(guess[index])
            }
        }
        
        var cows = 0
        
        var secretCowCount = [String.Element: Int]()
        
        for element in cowSecret {
            secretCowCount[element, default: 0] += 1
        }
        
        var guessCowCount = [String.Element: Int]()
        
        for element in cowGuess {
            guessCowCount[element, default: 0] += 1
        }
        
        for (element, count) in secretCowCount {
            if let guessCount = guessCowCount[element] {
                cows += min(count, guessCount)
            }
        }
        
        return "\(bulls)A\(cows)B"
    }
}
