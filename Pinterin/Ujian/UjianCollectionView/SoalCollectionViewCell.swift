//
//  SoalCollectionViewCell.swift
//  Pinterin
//
//  Created by andyptra on 11/10/17.
//  Copyright © 2017 andyptra. All rights reserved.
//

import UIKit

class SoalCollectionViewCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var indexSoal : Int = 0
    var soalPresenter : SoalPresenter?
    
    @IBOutlet weak var selesaiButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupTable(){
        self.tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cells = Bundle.main.loadNibNamed("SoalTableSectionHeader", owner: self, options: nil)?.first as! SoalTableViewSectionHeader
        cells.kategoriLabel.text = soalPresenter?.arrayOfSoal[indexSoal].kategori
        cells.soalLabel.text = soalPresenter?.arrayOfSoal[indexSoal].soal
        soalPresenter?.getJawabanIndex(indexSoal: indexSoal, indexKunciJawaban: (soalPresenter?.arrayOfSoal[indexSoal].jawaban)!)
       
        return cells
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("OpsiTableViewCell", owner: self, options: nil)?.first as! OpsiTableViewCell
        soalPresenter?.tampilOpsi(indexSoal: indexSoal)
       
      
        if let soalPresenter = soalPresenter {
            if((indexPath.row)==0){
                
                cell.opsiLabel.text = "A. \(soalPresenter.opsiArray[0])"
            }
            if((indexPath.row)==1){
                
                cell.opsiLabel.text = "B. \(soalPresenter.opsiArray[1])"
            }
            if((indexPath.row)==2){
                
                cell.opsiLabel.text = "C. \(soalPresenter.opsiArray[2])"
            }
            if((indexPath.row)==3){
                
                cell.opsiLabel.text = "D. \(soalPresenter.opsiArray[3])"
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        soalPresenter?.setJawabanIndex(indexSoal: indexSoal, indexJawaban: indexPath.row + 1)
       tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
       
       tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
