//
//  NetworkService.swift
//  BelajarJson
//
//  Created by andyptra on 11/9/17.
//  Copyright © 2017 andyptra. All rights reserved.
//

import Foundation

final class NetworkService {
    static func getSoal(completion : @escaping([Soal]) -> Void){
        let urlString = "https://api.myjson.com/bins/ilbyr"
        // let url = URL(string: urlString)
        guard let url = URL(string: urlString) else { return }
        if let jsonData = try? Data(contentsOf: url){
            let jsonDecoder = JSONDecoder()
            
            guard let questions = try? jsonDecoder.decode([Soal].self,from: jsonData) else {
                return
            }
            DispatchQueue.main.async {
                completion(questions)
            }
            
        }
    }

}
