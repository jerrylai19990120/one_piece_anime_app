//
//  DynamicTextView.swift
//  One Piece
//
//  Created by Jerry Lai on 2021-02-11.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import UIKit

@IBDesignable
class DynamicTextView: UITextView {

    override func prepareForInterfaceBuilder() {
        //setUpView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    func setUpView(){
        self.sizeToFit()
        self.isScrollEnabled = false
        self.translatesAutoresizingMaskIntoConstraints = true
    }

}
