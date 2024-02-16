//
//  NewTargetTableViewController.swift
//  KİŞİSEL HEDEF ASİSTANI
//
//  Created by Batu Dursun on 17.12.2023.
//

import UIKit

class NewTargetTableViewController: UITableViewController {
    
    //Hedefin isminin girileceği textField
    @IBOutlet var adTextField:UITextField!
    
    //Hedefin açıklamasının yapılacağı textField
    @IBOutlet var aciklamaTextField:UITextField!
    
    //Hedefin başlangıc tarihinin belirtileceği text field
    @IBOutlet var baslangicTarihTextField:UITextField!
    
    //Hedefin hangi değerlerde olmasını istediğimiz text field
    @IBOutlet var hedefTextField:UITextField!
    
    
    var hedef: Hedef? //hedef adında bir hedef nesnesi tanımladık
    //içi boş da olabileceği için soru işaretini sonuna ekledik.(optional)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Onceki sayfadan bir Hedef nesnesi turetildiyse;
        //hedefin özelliklerini sırasıyla ilgili text field içine yaz.
        if let hedef = hedef {
            adTextField.text = hedef.ad
            aciklamaTextField.text = hedef.aciklama
            baslangicTarihTextField.text = hedef.baslangicTarihi
            hedefTextField.text = hedef.hedef
        }
        
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Yalnızca Save'den geri dönülen kısım için devam etmelidir.
        guard segue.identifier == "saveUnwind" else { return }
        
        //Yeni hedef özelliklerini kullanıcının yazdığı textField içinden çektim.
        let name = adTextField.text!
        let description = aciklamaTextField.text!
        let tarih = baslangicTarihTextField.text!
        let target = hedefTextField.text!
        
        //burada da çektiğim hedef özelliklerini dizi içine attım böylece yeni bir hedef eklemiş oldu.
        hedef = Hedef(ad: name , aciklama: description, baslangicTarihi: tarih , hedef: target)
        
    }
}
