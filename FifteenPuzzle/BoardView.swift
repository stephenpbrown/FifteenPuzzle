//
//  BoardView.swift
//  PuzzleLayout
//
//  Created by Stephen Paul Brown on 2/2/17.
//  Copyright © 2017 Stephen Paul Brown. All rights reserved.
//

import UIKit

class BoardView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    
    override func awakeFromNib() {
        let tileImage = UIImage(named: "Tile")
        for tag in 1 ... 15 {
            let button = self.viewWithTag(tag) as! UIButton
            button.setBackgroundImage(tileImage, for: UIControlState())
            button.backgroundColor = UIColor.clear // transparent
        }
    }
 
    
    override func layoutSubviews() {
        super.layoutSubviews() // Let autolayout engine finish first
        
        let appDelegate = UIApplication.shared.delegate! as! AppDelegate
        let board = appDelegate.board // Get model from app delegate
        
        let boardSquare = boardRect() // Determine region to hold tiles (see below)
        let tileSize = boardSquare.width / 4.0
        
        let tileBounds = CGRect(x: 0, y: 0, width: tileSize, height: tileSize)
        
        for r in 0 ..< 4 {      // manually set the bounds, and of each tile
            for c in 0 ..< 4 {
                let tile = board!.getTile(atRow: r, atColumn: c)
                
                if tile > 0 {
                    let button = self.viewWithTag(tile)
                    button!.bounds = tileBounds
                    button!.center = CGPoint(x: boardSquare.origin.x + (CGFloat(c) + 0.5)*tileSize,
                                             y: boardSquare.origin.y + (CGFloat(r) + 0.5)*tileSize)
                }
            }
        }
    }
    
    func boardRect() -> CGRect { // Get square for holding 4x4 tiles buttons
        let W = self.bounds.size.width
        let H = self.bounds.size.height
        let margin : CGFloat = 10
        let size = ((W <= H) ? W : H) - 2*margin
        let boardSize : CGFloat = CGFloat((Int(size) + 7)/8)*8.0 // Next multiple of 8
        let leftMargin = (W - boardSize)/2
        let topMargin = (H - boardSize)/2
        return CGRect(x: leftMargin, y: topMargin, width: boardSize, height: boardSize)
    }
}
