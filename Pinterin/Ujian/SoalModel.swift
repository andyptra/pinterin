//
//  SoalModel.swift
//  Pinterin
//
//  Created by andyptra on 11/14/17.
//  Copyright © 2017 andyptra. All rights reserved.
//

import UIKit

struct Soal : Codable {
    let kategori : String,
    soal : String,
    opsi : Opsi,
    jawaban : Int
    struct Opsi : Codable {
        let a : String,
        b : String,
        c : String,
        d : String
    }
    
}


//class SoalModel {
//    weak var delegate : QuestionModelDelegate?
//    func requestData() {
//        NetworkService.getQuestion { (data) in
//        self.delegate?.didRecieveQuestion(model: data)
//            
//        }
//    }
//}

