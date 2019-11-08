//
//  PetunjukPresenter.swift
//  Pinterin
//
//  Created by andyptra on 11/17/17.
//  Copyright © 2017 andyptra. All rights reserved.
//

import Foundation
import UIKit
protocol PetunjukPresenterDelegate : class {
    func getGambarPetunjuk(indexGambar : Int) -> UIImage
    
}

class PetunjukPresenter : PetunjukPresenterDelegate {
    var arrayOfGambar : [UIImage] = [#imageLiteral(resourceName: "OpeningTpa"),#imageLiteral(resourceName: "OpeningSaintek"),#imageLiteral(resourceName: "OpeningSoshum")]
    
    
    func getGambarPetunjuk(indexGambar : Int) -> UIImage {
        return arrayOfGambar[indexGambar]
    }
    
    
    
}
