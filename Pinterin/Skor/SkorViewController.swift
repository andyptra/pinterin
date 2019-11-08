//
//  SkorViewController.swift
//  Pinterin
//
//  Created by andyptra on 11/12/17.
//  Copyright © 2017 andyptra. All rights reserved.
//

import UIKit

class SkorViewController: UIViewController {
  var jmlJawab : [Int] = []
    var kunciJawab : [Int] = []
    
    @IBOutlet weak var hasilSkor: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let s1: Set = Set<Int>(jmlJawab)
        let s2: Set = Set<Int>(kunciJawab)
        let counts = s1.intersection(s2).count
       print(jmlJawab)
        print(kunciJawab)
        hasilSkor.text = "\(counts)"
        view.addBackgroundScore()
    }
    
    @IBAction func cobaLagiButton(_ sender: Any) {
        
    }
    
    @IBAction func akhiriButton(_ sender: Any) {

       self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
}
