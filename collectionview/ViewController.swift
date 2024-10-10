//
//  ViewController.swift
//  collectionview
//
//  Created by Neosoft on 23/09/24.
//

import UIKit

//let productnames:[String] = ["Shoes","Salt","Shampoo","Sandle","Watch","Chair","Purse"]
//let productimages:[String] = ["shoes","salt","shampoo","sandle","watch","chair","purse"]

struct products{
    var productnames : String
    var productimages : String
}

var output = [products(productnames: "Shoes", productimages: "shoes"),
              products(productnames: "Salt", productimages: "salt"),
              products(productnames: "Shampoo", productimages: "shampoo"),
              products(productnames: "Sandle", productimages: "sandle"),
              products(productnames: "Watch", productimages: "watch"),
              products(productnames: "Chair", productimages: "chair"),
              products(productnames: "Purse", productimages: "purse")]

class ViewController: UIViewController {

    @IBOutlet weak var collection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "productscollectionviewcell", bundle: nil)
        collection.register(nib, forCellWithReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
        
        
       
    }
    
   

}

extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return output.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! productscollectionviewcell
        
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.blue.cgColor
        
        cell.img.image = UIImage(named: output[indexPath.row].productimages)
        cell.lbl.text = output[indexPath.row].productnames
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = (collectionView.frame.width - 10)/2
        return CGSize(width: size, height: size)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
                    let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headercell", for: indexPath)
            
                    return headerView
                }
        else if kind == UICollectionView.elementKindSectionFooter{
            let footerview = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footercell", for: indexPath)
            
            return footerview
        }
          
        return UICollectionReusableView()
    }
}
