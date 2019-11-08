//
//  DashboardPresenter.swift
//  Pinterin
//
//  Created by andyptra on 11/16/17.
//  Copyright © 2017 andyptra. All rights reserved.
//

import Foundation
import UIKit
protocol DashboardPresenterDelegate : class {
    func getGambarDashboard(indexGambar : Int) -> UIImage
  
}

class DashboardPresenter : DashboardPresenterDelegate {
    var arrayOfGambar : [UIImage] = [#imageLiteral(resourceName: "kategoriTpa"),#imageLiteral(resourceName: "KategoriSaintek"),#imageLiteral(resourceName: "KategoriSoshum")]
    func getGambarDashboard(indexGambar : Int) -> UIImage {
     return arrayOfGambar[indexGambar]
    }
  
}
