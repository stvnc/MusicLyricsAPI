//
//  ScrollView.swift
//  MusicLyricsAPI
//
//  Created by Vincent Angelo on 03/07/20.
//  Copyright © 2020 Vincent Angelo. All rights reserved.
//

import UIKit

class ScrollView: UIScrollView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.borderWidth = 2
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
