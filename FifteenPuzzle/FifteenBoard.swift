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
    
    // Used for checking if the puzzle is solved
    let solved :[[Int]] = [
        [1, 2, 3, 4],
        [5, 6, 7, 8],
        [9, 10, 11, 12],
        [13, 14, 15, 0] // 0 => empty slot
    ]
    
    enum slideDirection : Int {case left, right, up, down, none}
    
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
        for i in 0 ..< 4
        {
            for j in 0 ..< 4
            {
                if(state[i][j] == tile)
                {
                    return (i,j)
                }
            }
        }
        
        return (1,1) // Placeholder
    }
    
    // Determine if puzzle is in solved configuration.
    func isSolved() -> Bool
    {
//        if(state[0][0] != 1)
//        {
//            return false
//        }
        
        for i in 0 ..< 4
        {
            for j in 0 ..< 4
            {
//                var index = state[i][j]
//                
//                
                // Make more dynamic later
                // Check each value and make sure the next value is the previous value + 1 until you reach 0
                if(state[i][j] != solved[i][j])
                {
                    return false
                }
            }
        }
        
        return true
    }
    
    // Determine if the specified tile can be slid up into the empty space.
    func canSlideTileUp(atRow r : Int, Column c : Int) -> Bool
    {
        if(r == 0) // Check to make sure the array doesn't go out of bounds
        {
            return false
        }
        
        if(state[r-1][c] == 0) // Check to see if the tile above is empty
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    func canSlideTileDown(atRow r : Int, Column c : Int) -> Bool
    {
        if(r == 3) // Check to make sure the array doesn't go out of bounds
        {
            return false
        }
        
        if(state[r+1][c] == 0) // Check to see if the tile below is empty
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    func canSlideTileLeft(atRow r : Int, Column c : Int) -> Bool
    {
        if(c == 0) // Check to make sure the array doesn't go out of bounds
        {
            return false
        }
        
        if(state[r][c-1] == 0) // Check to see if the tile left is empty
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    func canSlideTileRight(atRow r : Int, Column c : Int) -> Bool
    {
        if(c == 3) // Check to make sure the array doesn't go out of bounds
        {
            return false
        }
        
        if(state[r][c+1] == 0) // Check to see if the tile right is empty
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    // Slide the tile into the empty space.
    func canSlideTile(atRow r : Int, Column c : Int) -> slideDirection
    {
        if(canSlideTileUp(atRow: r, Column: c))
        {
            return slideDirection.up
        }
        else if(canSlideTileDown(atRow: r, Column: c))
        {
            return slideDirection.down
        }
        else if(canSlideTileLeft(atRow: r, Column: c))
        {
            return slideDirection.left
        }
        else if(canSlideTileRight(atRow: r, Column: c))
        {
            return slideDirection.right
        }
        else
        {
            return slideDirection.none
        }
    }
}
