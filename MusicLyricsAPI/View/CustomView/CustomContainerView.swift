//
//  CustomContainerView.swift
//  MusicLyricsAPI
//
//  Created by Vincent Angelo on 02/07/20.
//  Copyright © 2020 Vincent Angelo. All rights reserved.
//

import UIKit

class CustomContainerView: UIView {
    
    init(image: UIImage, textField: UITextField) {
        super.init(frame: .zero)
        setHeight(height: 50)
        layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.borderWidth = 2
        
        let iv = UIImageView()
        iv.image = image
        iv.tintColor = .black
        iv.alpha = 0.7
        
        addSubview(iv)
        iv.centerY(inView: self)
        iv.anchor(left: leftAnchor, paddingLeft: 8)
        iv.setDimensions(height: 24, width: 24)
        
        addSubview(textField)
        textField.centerY(inView: self)
        textField.anchor(left: iv.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingLeft: 8, paddingBottom: 2)
        
        let dividerView = UIView()
        dividerView.backgroundColor = .black
        
        addSubview(dividerView)
        dividerView.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingLeft: 8, height: 0.75)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

