//
//  ViewController.swift
//  Pinterin
//
//  Created by andyptra on 10/22/17.
//  Copyright © 2017 andyptra. All rights reserved.
//

import UIKit

class ViewController: UIViewController, BWWalkthroughViewControllerDelegate {

   
    override func viewDidLoad() {

        
 
            
            DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                // Get view controllers and build the walkthrough
                let stb = UIStoryboard(name: "Main", bundle: nil)
                let walkthrough = stb.instantiateViewController(withIdentifier: "bw0") as! BWWalkthroughViewController
                let page_one = stb.instantiateViewController(withIdentifier: "bw1") as UIViewController
                let page_two = stb.instantiateViewController(withIdentifier: "bw2") as UIViewController
                let page_three = stb.instantiateViewController(withIdentifier: "bw3") as UIViewController
                
                // Attach the pages to the master
                walkthrough.delegate = self
                walkthrough.add(viewController:page_one)
             walkthrough.add(viewController:page_two)
                walkthrough.add(viewController:page_three)
                self.present(walkthrough, animated: true, completion: nil)
            })
            
     
        
        
  
    }
    
    func walkthroughPageDidChange(_ pageNumber: Int) {
        print("Current Page \(pageNumber)")
    }
    

    
}

