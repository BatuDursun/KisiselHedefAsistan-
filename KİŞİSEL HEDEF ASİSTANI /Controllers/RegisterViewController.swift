//
//  RegisterViewController.swift
//  KİŞİSEL HEDEF ASİSTANI
//
//  Created by Batu Dursun on 14.12.2023.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    
    //register ekranında 2 tane text field 1 tane de button olduğundan özel bir isimle onları tanımladım.
    
    @IBOutlet var emailTextField:UITextField!
    @IBOutlet var parolaTextField:UITextField!
    
    
    @IBOutlet var kayitOlButton:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    //Kayıt Ol butonuna tıklandığında olmasını istediğimiz aksiyonlar:
    @IBAction func kayitOlButtonTapped(){
        
        //IF let yapisi ile email ve parolanin bos olup olmadigi kontrolu saglandi.
        if let email = emailTextField.text { //email textField ının içi boş değil ise onu 'email' değişkenine ata.
            if let parola = parolaTextField.text { //parolatextField ının içi boş değil ise onu 'parola' değişkenine ata.
                
                //yapilacak islemler
                Auth.auth().createUser(withEmail: email, password: parola) { firebaseResult, error in//Fire baseye veri ekleme kısımı
                   
                    if let errorVarMi = error {
                        //Eğer hata var ise showMessage adlı fonksiyonu çağırıyor ve içine yazdığımız şeyi ekrana bastırıyor.
                        self.showMessage("Tekrar Deneyin","Lütfen E-mail formatına ve Parolanın minimum 6 karakter olmasına dikkat edin.")
                    }
                    else {
                        //Eğer hata yok ise showMessage adlı fonksiyon yardımıyla işlem tamamlandı mesajını veriyor.
                        self.showMessage("İşlem Tamamlandı.","Hesabınız oluşturuldu , lütfen giriş yapınız.")
                    }
                }
                
            }
            
            else {return}
            
        }
        else {return}
        
    }
    //showMessage adlı fonksiyon tanımlama
    @objc func showMessage(_ baslik:String, _ icerik:String) {
        // UIAlertController
        // Yazdırılacak başlık ve  mesaj parametre yoluyla aktarılıyor.
           let alertController = UIAlertController(title: baslik , message: icerik, preferredStyle: .alert)
           
           // UIAlertAction oluştur (Kullanıcı butona tıkladığında ne olacağını belirtir)
        let okAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
           
           // UIAlertAction'ı UIAlertController'a ekle
           alertController.addAction(okAction)
           
           // UIAlertController'ı ekranda göster
           present(alertController, animated: true, completion: nil)
       }
}
    
    
