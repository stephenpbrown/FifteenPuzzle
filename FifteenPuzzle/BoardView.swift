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

    override func layoutSubviews() {
        super.layoutSubviews() // Let auto layout do its thing
        
        // Layout 15 buttons programmatically
        NSLog("Layout buttons here")
        
    }
    
}
