//
//  SoalPresenter.swift
//  Pinterin
//
//  Created by andyptra on 11/14/17.
//  Copyright © 2017 andyptra. All rights reserved.
//

import Foundation
protocol SoalPresenterDelegate: class {
    func didRecieveSoal(model : [Soal])
}
class SoalPresenter  {
    weak var delegate : SoalPresenterDelegate?
    var opsiArray : [String] = []
    var arrayOfSoal : [Soal] = []
    var jawabanIndex : [Int] = []
    var kunciJawaban : [Int] = []
    func requestData() {
        NetworkService.getSoal { (data) in
            self.delegate?.didRecieveSoal(model: data)
            self.arrayOfSoal = data
            self.jawabanIndex = Array(repeating: 0, count: self.arrayOfSoal.count)
            self.kunciJawaban = Array(repeating: 0, count: self.arrayOfSoal.count)
            print(self.kunciJawaban)
        }
    }
    func getJawabanIndex(indexSoal : Int, indexKunciJawaban : Int){
        kunciJawaban[indexSoal] = indexKunciJawaban
    }
    func setJawabanIndex(indexSoal : Int, indexJawaban : Int){
        jawabanIndex[indexSoal] = indexJawaban
    }
    func tampilOpsi(indexSoal : Int){
        opsiArray.removeAll()
        opsiArray.append(arrayOfSoal[indexSoal].opsi.a)
        opsiArray.append(arrayOfSoal[indexSoal].opsi.b)
        opsiArray.append(arrayOfSoal[indexSoal].opsi.c)
        opsiArray.append(arrayOfSoal[indexSoal].opsi.d)
        
        
    }
    
}
