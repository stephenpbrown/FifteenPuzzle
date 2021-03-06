//
//  ViewController.swift
//  PuzzleLayout
//
//  Created by Stephen Paul Brown on 2/2/17.
//  Copyright © 2017 Stephen Paul Brown. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBOutlet weak var boardView: BoardView!
    
    @IBAction func tileSelected(_ sender: UIButton) {
        let tag = sender.tag
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let board = appDelegate.board
        
        let pos = board!.getRowAndColumn(forTile: sender.tag)
        let buttonBounds = sender.bounds
        var buttonCenter = sender.center
        var slide = true
        if board!.canSlideTileUp(atRow: pos.row, Column: pos.column) {
            buttonCenter.y -= buttonBounds.size.height
        } else if board!.canSlideTileDown(atRow: pos.row, Column: pos.column) {
            buttonCenter.y += buttonBounds.size.height
        } else if board!.canSlideTileLeft(atRow: pos.row, Column: pos.column) {
            buttonCenter.x -= buttonBounds.size.width
        } else if board!.canSlideTileRight(atRow: pos.row, Column: pos.column) {
            buttonCenter.x += buttonBounds.size.width
        } else {
            slide = false
        }
        
        
        if (slide)
        {
            let index = board!.getRowAndColumn(forTile: tag)
            
            let slideDirection = board!.canSlideTile(atRow: index.row, Column: index.column)
            
            board!.slideTile(atRow: index.row, atColumn: index.column, moveDirection: slideDirection)
            
            // Check if solved
            if(board!.isSolved())
            {
                let alertController = UIAlertController(
                    title: "Great job! You solved the puzzle!",
                    message: "",
                    preferredStyle: .alert
                )
                alertController.addAction(UIAlertAction(
                    title: "New Game",
                    style: .default,
                    handler: { (UIAlertAction) -> Void in
                        board!.scramble(numTimes: appDelegate.numShuffles)
                        self.boardView.setNeedsLayout() // will trigger layoutSubviews to be invoked
                })
                )

                self.present(alertController, animated: true, completion: nil)
                //let myString = "Solved!"
                //NSLog("\(myString)")
            }
            
            UIView.animate(withDuration: 0.5, animations: {sender.center = buttonCenter})
        }
    }
    
    
    @IBAction func shuffleTiles(_ sender: AnyObject) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let board = appDelegate.board
        board?.scramble(numTimes: appDelegate.numShuffles)
        self.boardView.setNeedsLayout() // will trigger layoutSubviews to be invoked
    }
}

