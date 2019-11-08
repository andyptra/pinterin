//
//  PetunjukPenggunaanViewController.swift
//  Pinterin
//
//  Created by andyptra on 11/11/17.
//  Copyright © 2017 andyptra. All rights reserved.
//

import UIKit

class PetunjukPenggunaanViewController: UIViewController {
    var tinggi : CGFloat = 1
    var lebar : CGFloat = 1
    var spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    var loadingView: UIView = UIView()
    var idKategoriSoal:Int?
    var petunjukPresenter : PetunjukPresenter!
    //var idKategori : Int = 0
    @IBOutlet weak var jarakGambar: NSLayoutConstraint!
    @IBOutlet weak var jarakLabel: NSLayoutConstraint!
    @IBOutlet weak var jarakLabelGambar: NSLayoutConstraint!
    @IBOutlet weak var lebarGambar: NSLayoutConstraint!
    @IBOutlet weak var tinggiGambar: NSLayoutConstraint!
    @IBOutlet weak var deskripsiLabel: UILabel!
    @IBOutlet weak var gambarPetunjuk: UIImageView!
    @IBOutlet weak var KategoriLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       petunjukPresenter = PetunjukPresenter()
        if let idKatSoal = idKategoriSoal{
            if (idKatSoal == 1){
                KategoriLabel.text = "TKPA"
                KategoriLabel.textColor = UIColor(red:0.24, green:0.52, blue:0.66, alpha:1.0)
               gambarPetunjuk.image = petunjukPresenter.getGambarPetunjuk(indexGambar: 0)
             
                
            }
            else if (idKatSoal == 2){
                KategoriLabel.text = "SAINTEK"
                KategoriLabel.textColor = UIColor(red:0.27, green:0.73, blue:0.74, alpha:1.0)
                gambarPetunjuk.image = petunjukPresenter.getGambarPetunjuk(indexGambar: 1)
            }
            else if (idKatSoal == 3){
                KategoriLabel.text = "SOSHUM"
                KategoriLabel.textColor = UIColor(red:0.49, green:0.75, blue:0.67, alpha:1.0)
                 gambarPetunjuk.image = petunjukPresenter.getGambarPetunjuk(indexGambar: 2)
            }
        }
        
        if  UIScreen.main.bounds.height < 667 {
            tinggi = UIScreen.main.bounds.height/667
        }
        else if UIScreen.main.bounds.width < 375 {
            lebar = UIScreen.main.bounds.width
        }
        else if UIScreen.main.bounds.width > 375 {
            lebar = UIScreen.main.bounds.width
        }
        else if UIScreen.main.bounds.height  > 667 {
            tinggi = UIScreen.main.bounds.height/667
        }
        jarakGambar.constant = jarakGambar.constant*tinggi
        tinggiGambar.constant = tinggiGambar.constant*tinggi
        jarakLabelGambar.constant = jarakLabelGambar.constant*tinggi
        jarakLabel.constant = jarakLabel.constant*tinggi
        lebarGambar.constant = tinggiGambar.constant
        print(tinggiGambar.constant)
        print(lebarGambar.constant)
        deskripsiLabel.font = UIFont.systemFont(ofSize: 14*tinggi)

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideActivityIndicator()
    }
    @IBAction func mulaiButton(_ sender: Any) {
        
        let mulaiSoal = storyboard?.instantiateViewController(withIdentifier: "SoalIdentifier") as! SoalViewController
        self.present(mulaiSoal, animated:true, completion:nil)
        showActivityIndicator()
   
    }
    func showActivityIndicator() {
        DispatchQueue.main.async() {
            self.loadingView = UIView()
            self.loadingView.frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
            self.loadingView.center = self.view.center
            self.loadingView.backgroundColor = UIColor.gray
            self.loadingView.alpha = 0.7
            self.loadingView.clipsToBounds = true
            self.loadingView.layer.cornerRadius = 10
            
            self.spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
            self.spinner.frame = CGRect(x: 0.0, y: 0.0, width: 80.0, height: 80.0)
            self.spinner.center = CGPoint(x:self.loadingView.bounds.size.width / 2, y:self.loadingView.bounds.size.height / 2)
            
            self.loadingView.addSubview(self.spinner)
            self.view.addSubview(self.loadingView)
            self.spinner.startAnimating()
        }
    }
        func hideActivityIndicator() {
            DispatchQueue.main.async() {
                self.spinner.stopAnimating()
                self.loadingView.removeFromSuperview()
            }
        }
    
    
    
}
