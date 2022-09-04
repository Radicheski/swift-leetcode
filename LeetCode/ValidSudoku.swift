//
//  ValidSudoku.swift
//  https://leetcode.com/problems/valid-sudoku/
//
//  Created by Erik Radicheski da Silva on 04/09/22.
//

import XCTest

class ValidSudoku: XCTestCase {

    func test() {
        let solution = Solution()
        
        var input: [[Character]]
        
        input = [["5","3",".",".","7",".",".",".","."]
                 ,["6",".",".","1","9","5",".",".","."]
                 ,[".","9","8",".",".",".",".","6","."]
                 ,["8",".",".",".","6",".",".",".","3"]
                 ,["4",".",".","8",".","3",".",".","1"]
                 ,["7",".",".",".","2",".",".",".","6"]
                 ,[".","6",".",".",".",".","2","8","."]
                 ,[".",".",".","4","1","9",".",".","5"]
                 ,[".",".",".",".","8",".",".","7","9"]]
        XCTAssertTrue(solution.isValidSudoku(input))
        
        input = [["8","3",".",".","7",".",".",".","."]
                 ,["6",".",".","1","9","5",".",".","."]
                 ,[".","9","8",".",".",".",".","6","."]
                 ,["8",".",".",".","6",".",".",".","3"]
                 ,["4",".",".","8",".","3",".",".","1"]
                 ,["7",".",".",".","2",".",".",".","6"]
                 ,[".","6",".",".",".",".","2","8","."]
                 ,[".",".",".","4","1","9",".",".","5"]
                 ,[".",".",".",".","8",".",".","7","9"]]
        XCTAssertFalse(solution.isValidSudoku(input))
        
    }

}

private class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        for row in board {
            if !isValid(row) {
                return false
            }
        }
        
        for index in 0 ..< 9 {
            var column = [Character]()
            for row in board {
                column.append(row[index])
            }
            
            if !isValid(column) {
                return false
            }
        }
        
        for row in [0, 3, 6] {
            for column in [0, 3, 6] {
                var array = [Character]()
                array.append(contentsOf: board[row][column ..< column + 3])
                array.append(contentsOf: board[row + 1][column ..< column + 3])
                array.append(contentsOf: board[row + 2][column ..< column + 3])
                if !isValid(array) {
                    return false
                }
            }
        }
        
        return true
    }
    
    private func isValid(_ array: [Character]) -> Bool {
        var set = Set<Character>()
        
        for element in array where element != "." {
            if set.contains(element) {
                return false
            }
            set.insert(element)
        }
        
        return true
    }
}
