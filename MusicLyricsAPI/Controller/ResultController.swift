//
//  ResultController.swift
//  MusicLyricsAPI
//
//  Created by Vincent Angelo on 03/07/20.
//  Copyright © 2020 Vincent Angelo. All rights reserved.
//

import UIKit

class ResultController: UIViewController {
    
    var lyric: Lyrics?
    var song: String?
    
    lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
//        sv.isDirectionalLockEnabled = true
        sv.addSubview(lyricLabel)
        lyricLabel.anchor(top: sv.topAnchor, left: sv.leftAnchor, bottom: sv.bottomAnchor, right: sv.rightAnchor, paddingLeft: 10, paddingRight: 10)
        return sv
    }()
    
    lazy var lyricLabel: UILabel = {
        let label = UILabel()
        label.text = lyric?.lyrics
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.clipsToBounds = true
        label.textColor = .black
        return label
    }()
    
    init(_ lyrics: Lyrics, withSong song: String){
        super.init(nibName: nil, bundle: nil)
        self.lyric = lyrics
        self.song = song
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.title = song?.replacingOccurrences(of: "%20", with: " ")
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isHidden = false
    }
    
    
    func configureUI(){
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.contentSize = view.bounds.size
        scrollView.setDimensions(height: view.frame.height, width: view.frame.width)
        scrollView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 32, paddingRight: 32)
        
        
    }
}
