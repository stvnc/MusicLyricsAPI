//
//  LyricsStore.swift
//  MusicLyricsAPI
//
//  Created by Vincent Angelo on 02/07/20.
//  Copyright © 2020 Vincent Angelo. All rights reserved.
//

import Foundation

class LyricsStore {
    static var shared = LyricsStore()
    
    private init(){}
    
    func fetchLyrics(searchFor search: Search, completion: @escaping(Lyrics) -> Void, errorHandler: @escaping(Error) -> Void){
        let session = URLSession.shared
        
        print("https://api.lyrics.ovh/v1/\(search.artist)/\(search.title)")
        
        guard let url = URL(string: "https://api.lyrics.ovh/v1/\(search.artist)/\(search.title)") else { return }
        
        let urlRequest = URLRequest(url: url)
        
        session.dataTask(with: urlRequest) { (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else { return }
                        guard let data = data else {
                DispatchQueue.main.async {
                    errorHandler(NSError(domain: "", code: 0, userInfo: nil))
                }
                return
            }
            
            do {
                let lyrics = try JSONDecoder().decode(Lyrics.self, from: data)
                print(lyrics)
                DispatchQueue.main.async {
                    completion(lyrics)
                }
            }catch {
                return
            }
        }.resume()
    }
}
