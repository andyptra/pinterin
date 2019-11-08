//
//  SoalViewController.swift
//  Pinterin
//
//  Created by andyptra on 11/7/17.
//  Copyright © 2017 andyptra. All rights reserved.
//

import UIKit
protocol SoalViewDelegate {
    func navigate(viewController : UIViewController)
}
class SoalViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout, SoalPresenterDelegate{
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionFlowLayout: UICollectionViewFlowLayout!
    
    var modela : [Soal] = []
    
    let reuseIdentifier = "SoalCv"
    var tinggi : CGFloat = 1
    var lebar : CGFloat = 1
    
    @IBOutlet weak var labelNav: UILabel!
    @IBOutlet weak var tinggiNav: NSLayoutConstraint!
    
    private let soalPresenter = SoalPresenter()
    
    func didRecieveSoal(model: [Soal]) {
        print(model[0].soal)
        modela = model
    }

    override func viewDidLoad() {

        super.viewDidLoad()
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
        labelNav.font = UIFont.systemFont(ofSize: 17*tinggi)
        tinggiNav.constant = tinggiNav.constant*tinggi
        collectionView.register(UINib(nibName: "SoalCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SoalCv")
    soalPresenter.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionFlowLayout.itemSize = CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
      soalPresenter.requestData()
        
    }
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return soalPresenter.arrayOfSoal.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    @objc func navigateToSkor (){
        let skoor = SkorViewController(nibName: "SkorViewController", bundle: nil) as SkorViewController
       skoor.jmlJawab = soalPresenter.jawabanIndex
        skoor.kunciJawab = soalPresenter.kunciJawaban
        self.present(skoor, animated: true, completion: nil)
    }
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! SoalCollectionViewCell

        cell.indexSoal = indexPath.row
        cell.soalPresenter = soalPresenter
        cell.setupTable()
        cell.tableView.reloadData()

        let item = self.collectionView(self.collectionView!, numberOfItemsInSection: 0) - 1
        if indexPath.row==item{
            cell.selesaiButton.isHidden = false
            cell.selesaiButton.addTarget(self, action: #selector(navigateToSkor), for: .touchUpInside)
        }
        else {
           
            cell.selesaiButton.isHidden = true
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = CGSize(width: (collectionView.bounds.width ), height: (collectionView.bounds.height))
        
        
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
   
}
