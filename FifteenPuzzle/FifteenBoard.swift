//
//  FifteenBoard.swift
//  FifteenPuzzle
//
//  Created by Stephen Paul Brown on 2/8/17.
//  Copyright © 2017 Stephen Paul Brown. All rights reserved.
//

import Foundation

class FifteenBoard {
    var state : [[Int]] = [
        [1, 2, 3, 4],
        [5, 6, 7, 8],
        [9, 10, 11, 12],
        [13, 14, 15, 0] // 0 => empty slot
    ]
    
    // Choose one of the “slidable” tiles at random and slide it into the empty space; repeat n times. We use this method to start a new game using a large value (e.g., 150) for n.
    func scramble(numTimes n : Int)
    {
        
    }
    
    // Fetch the tile at the given position (0 is used for the space).
    func getTile(atRow r : Int, atColumn c : Int) -> Int
    {
        return state[r][c]
    }
    
    // Find the position of the given tile (0 is used for the space) – returns tuple holding row and column.
    func getRowAndColumn(forTile tile : Int) -> (row : Int, column : Int)?
    {
        return (1,1) // Placeholder
    }
    
    // Determine if puzzle is in solved configuration.
    func isSolved() -> Bool
    {
        return false // Placeholder
    }
    
    // Determine if the specified tile can be slid up into the empty space.
    func canSlideTileUp(atRow r : Int, column c : Int) -> Bool
    {
        return false // Placeholder
    }
    
    func canSlideTileDown(atRow r : Int, Column c : Int) -> Bool
    {
        return false // Placeholder
    }
    
    func canSlideTileLeft(atRow r : Int, Column c : Int) -> Bool
    {
        return false // Placeholder
    }
    
    func canSlideTileRight(atRow r : Int, Column c : Int) -> Bool
    {
        return false // Placeholder
    }
    
    // Slide the tile into the empty space.
    func canSlideTile(atRow r : Int, Column c : Int) -> Bool
    {
        return false // Placeholder
    }
}
