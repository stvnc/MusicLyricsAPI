//
//  SearchController.swift
//  MusicLyricsAPI
//
//  Created by Vincent Angelo on 02/07/20.
//  Copyright © 2020 Vincent Angelo. All rights reserved.
//

import UIKit

class SearchController: UIViewController {

    private let appLogo: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "AppLogo").withRenderingMode(.alwaysOriginal)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private let artistTextField: CustomTextField = {
       return CustomTextField(withPlaceholder: "Artist")
    }()
    
    private let songTextField: CustomTextField = {
        return CustomTextField(withPlaceholder: "Song")
    }()
    
    private lazy var artistContainerView: CustomContainerView = {
        return CustomContainerView(image: #imageLiteral(resourceName: "user"), textField: artistTextField)
    }()
    
    private lazy var songContainerView: CustomContainerView = {
        return CustomContainerView(image: #imageLiteral(resourceName: "song"), textField: songTextField)
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Search", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = #colorLiteral(red: 0.501310374, green: 1, blue: 0.6429474304, alpha: 1)
        button.titleLabel?.textColor = .black
        button.addTarget(self, action: #selector(handleSearchTapped), for: .touchUpInside)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        setEmpty()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .default
    }
    
    func setEmpty(){
        artistTextField.text = ""
        songTextField.text = ""
    }
    
    func configureUI(){
        view.backgroundColor = .white
        
        view.insetsLayoutMarginsFromSafeArea = false
        
        view.addSubview(appLogo)
        appLogo.setDimensions(height: 250, width: 250)
        appLogo.centerX(inView: view)
        appLogo.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        
        let stack = UIStackView(arrangedSubviews: [artistContainerView, songContainerView, searchButton])
        stack.axis = .vertical
        stack.spacing = 15
        stack.distribution = .fillProportionally
        
        view.addSubview(stack)
        stack.anchor(top: appLogo.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 15, paddingLeft: 32, paddingRight: 32)
        
    }
    
    
    @objc func handleSearchTapped(){
        guard var artist = artistTextField.text else { return }
        artist = artist.replacingOccurrences(of: " ", with: "%20")
        guard var song = songTextField.text else { return }
        song = song.replacingOccurrences(of: " ", with: "%20")
        
        let setSearch = Search(artist: artist, title: song)
        
        print("DEBUG: Artist = \(artist)")
        
        LyricsStore.shared.fetchLyrics(searchFor: setSearch, completion: { lyric in
            let controller = ResultController(lyric, withSong: song)
            self.navigationController?.pushViewController(controller, animated: true)
        }) { error in
            print(error.localizedDescription)
            return
        }
        
    }
}
