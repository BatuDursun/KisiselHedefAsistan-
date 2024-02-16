//
//  HedeflerTableViewController.swift
//  KİŞİSEL HEDEF ASİSTANI
//
//  Created by Batu Dursun on 17.12.2023.
//

import UIKit

class HedeflerTableViewController: UITableViewController {
    
    
    //Hedef sınıfından bir dizi oluşturduk
    //Hedef sınıfının tanımlamasını ayrı bir dosyada foundation olarak tanımladık.
    var hedefler:[Hedef] = [
        
        //Burada başlangıçta istediğiniz Hedefin adını açıklamasını baslangıc tarihini veya hedefinizin özelliklerini yazabilirsiniz.
        //Ben neyin nereye yazılması gerektiği belli olsun istediğim için böyle bir dizi başlangıçta tanımladım.
        
        Hedef(ad: "Hedef Adi", aciklama: "Aciklamasi", baslangicTarihi: "Baslangic Tarih", hedef: "Hedef Ozellikleri ") ,
        
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    //Table view için özel olarak oluşturulmuş fonksiyonlar.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // O an secili olan hucrenin indexPathini verir.
        if segue.identifier == "toEdit" {
            let selectedIndexPath = tableView.indexPathForSelectedRow!
             
            // O an secili olan index ile 'hedefler ' arrayinden ilgili objeye ulasilir.
            let selectedTarget = hedefler[selectedIndexPath.row]
            
            //Segue'nin Storyboard'da bagli oldugu yer bir navigation Controllerdir
            let navigationController = segue.destination as! UINavigationController
            
            //Navigation controllerin topViewController(kendisine bagli olan ilk sayfa) ulasilir.
            let editTargetController = navigationController.topViewController as! NewTargetTableViewController
            
            //Gidilecek sayfada bulunan 'hedef' degiskenini doldurmak icin;
            editTargetController.hedef = selectedTarget
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        //1 section var ise bu fonksiyona gerek yoktur.Cunku varsayilan section sayisi zaten 1 dir.
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Her section icin 1 kez calisir.Ornegin 4 sectiona sahip bir tableView varsa 4 kez calisir.
        
        // return 10 -> Her sectionda 10 hucre olucagini soyler.
        return hedefler.count // Elimizdeki hedef sayisi kadar hucre olmasi icin
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Bir hücre ekrana geleceği zaman cellForRow ile çizilir.Bu fonksiyonun kaç kez çalışacağı belli değildir.
        //Örnek 1: Kullanıcı hiç scroll etmez ise ekranda görünebilir olan hücre sayısı kadar çalışır.
        //Örnek 2:Kullanıcı scroll etmeye başlarsa scroll ettiği sürece bu fonksiyon çalışır.
        
        //indexPath : O an çizilmekte olan hücrenin konum bilgisi
        
        //Adım 1 : O an çizilmekte olan emoji nesnesine indexPath değeri ile ulaşmak.
        
        let targets = hedefler[indexPath.row] //Emojiye ulastik.
        
        //Adım 2 : Hücre oluşturmak
        //reuseIdentifier:Storyboard ' da hücre için verdiğiniz id değeri.
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"HedefCell") as! HedeflerTableViewCell//Hucre de olusturduk.
        
        
        //Adim 3 : Hucreyi data ile doldurma
        
        cell.update(with: targets)
        
        //Adim 4 : Olusturulan hucreyi return et.
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Bu fonksiyon, kullanici bir hucrenizi sectigi zaman calisir. (uzerine tiklandiginda)
        // indexPath : Uzerine tiklanilan hucrenin konum bilgisi
        
        //indexPath ' in row property ' sini kullanarak uzerine emoji nesnesine ulasilabilir.
        
        
        //Storyboard da 'toEdit' adına sahip olan segue çalıştırılır.
        let selectedTarget = hedefler[indexPath.row]
        performSegue(withIdentifier: "toEdit", sender: nil)
        print("\(selectedTarget.ad) \(indexPath)" )
        
        
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        //sourceIndexPath : Sirasi degistirilmek istenen hucrenin konumu
        //destinationIndexPath : Gidilmesi istenen konum.(Parmak ekrandan kaldirilinca)
        // COK ONEMLI : 'emojis' array'in tableView hucre sirasi ile her zaman ayni kalmasi gerekir.Bu senkronu saglayabilmek icin
        //hareket ettirilen objenin , array ' de konumunu degistiririz.
        
        //Adim 1 : Hareket ettirilen Emoji nesnesine ulasmak ve array'den silmek
        let movedTarget = hedefler.remove(at: sourceIndexPath.row)
        
        //Adim 2 : Silinen elemani , array ' de yeni konumuna yerlestirmek.(Gidilecek konuma)
        
        hedefler.insert(movedTarget, at: destinationIndexPath.row)
        
        //Adim 3 : TableView ' in yeniden cizilmesini saglar.
        //Boylece TableView , guncellenen array sirasiyla tum elemanlari tekrar cizer.
        tableView.reloadData()
        
        
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        //Bu fonksiyon tableView editing modundayken her hücrenin hangi tür
        //editing style a sahip olacağını belirtir.
        
       // return .none -> Hiçbir şey göstermez boş bir sembol gözükür.
       //return .insert -> Ekleme emojisi '+' gözükür.
        return .delete // Silme işlemi için gereklidir. '-' gözükür.
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //Editing aksiyonunun gerçekleştiği hücrenin konumu -> indexPath
        //editingStyle : Gerçekleşen aksiyon (.delete veya .insert)
        
        if editingStyle == .delete {
            //Adım 1 : hedefler arrayinden indexPath.row'da bulunan objeyi sil
            hedefler.remove(at: indexPath.row)
            
            //Adım 2 : TableView ' a hücrenin silinmesi gerektiği bilgisini verir.
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    @IBAction func editButtonTapped(_ button:UIBarButtonItem) {
        
        let tableViewEditMode = tableView.isEditing // O an table viewin edit modda olup olmadigini anlatir.
        
        
        //'!' Boolean degerinin tersini alir.
        tableView.setEditing(!tableViewEditMode , animated: true) //Edite girmeyi veya cikmayi saglar.
        
    }
    
    @IBAction func unwindFromNewEmoji(_ segue:UIStoryboardSegue){
        //Bu fonksiyon NewTargetViewController tarafından çalıştırılacak.
        //Cancel butonu gibi geri dönmeyi gerektiren durumlarda kullanılır.
        //Geri dönmek istediğimiz sayfaya yazılır.
        
        guard segue.identifier == "saveUnwind",
                let sourceViewController = segue.source as? NewTargetTableViewController,
              let newTargets = sourceViewController.hedef else {  return  }
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            
            //Daha onceden bir hucre secilmis ise
            //Emojinin ve TableView hucresinin guncellenmesi gerekiyor.
            
            //Adim1: 'hedefler' arrayinin secili hucresinin index'inde bulunan nesne guncellemesi
            hedefler[selectedIndexPath.row] = newTargets
            
            //Adim2: Yalnizca secili olan hucrenin yeniden cizilmesini saglar.
            tableView.reloadRows(at: [selectedIndexPath], with: .none)
            
        }
        else {
            //Eger secilmemis ise yeni bir hucre eklenmis demektir.
            // Yeni bir hücre için IndexPath oluştur.
            let newIndexPath = IndexPath(row: hedefler.count, section: 0)
            
            //Yeni emoji objesini emojis arrayine ekle
            hedefler.append(newTargets)
            
            //Oluşturulan IndexPath ile TableView ' a yeni bir hücre ekle.
            tableView.insertRows(at: [newIndexPath], with: .automatic)
            
        }
        
    }
    
    
    
}
