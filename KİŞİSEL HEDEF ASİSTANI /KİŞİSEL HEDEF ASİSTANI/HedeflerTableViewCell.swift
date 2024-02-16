//
//  HedeflerTableViewCell.swift
//  KİŞİSEL HEDEF ASİSTANI
//
//  Created by Batu Dursun on 17.12.2023.
//

import UIKit

class HedeflerTableViewCell: UITableViewCell {
    //TableView hücresi sınıfından olduğunu belirttim.
    
    // MARK: - UI Elements
    
    //Ad açıklama tarih hedef gibi labelları tanımladım.
    @IBOutlet var adLabel:UILabel!
    @IBOutlet var aciklamaLabel:UILabel!
    @IBOutlet var baslangicTarihLabel:UILabel!
    @IBOutlet var hedefLabel:UILabel!
    
    
    //MARK: - Functions
    
    //Update fonksiyonu sayesinde labellar üstündeki textleri güncelledim.
    func update(with targets : Hedef) {
        
        adLabel.text = targets.ad
        aciklamaLabel.text = targets.aciklama
        baslangicTarihLabel.text = targets.baslangicTarihi
        hedefLabel.text = targets.hedef
        
    }
    
}

