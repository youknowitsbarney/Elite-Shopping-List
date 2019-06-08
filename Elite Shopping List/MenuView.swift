//
//  MenuView.swift
//  Elite Shopping List
//
//  Created by Barney on 07/06/2019.
//  Copyright © 2019 Barney Corp. All rights reserved.
//

import UIKit

class MenuView: UIView {

    override func draw(_ rect: CGRect) {
        
        self.layer.cornerRadius = 5
        self.layer.shadowRadius = 2
        self.layoutIfNeeded()
        
        super.draw(rect)
    }


}
