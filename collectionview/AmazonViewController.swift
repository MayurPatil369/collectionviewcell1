//
//  AmazonViewController.swift
//  collectionview
//
//  Created by Neosoft on 23/09/24.
//

import UIKit

let mainimage:[String] = ["shoes","salt","shampoo"]
let productnames1:[String] = ["Shoes","Salt","Shampoo","Sandle","Watch","Chair"]
let productimages1:[String] = ["shoes","salt","shampoo","sandle","watch","chair"]

class AmazonViewController: UIViewController {

    @IBOutlet weak var collection2: UICollectionView!
    @IBOutlet weak var collection1: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib1 = UINib(nibName: "FirstCollectionViewCell", bundle: nil)
        collection1.register(nib1, forCellWithReuseIdentifier: "collection1cell")
        
        let nib2 = UINib(nibName: "SecondCollectionViewCell", bundle: nil)
        collection2.register(nib2, forCellWithReuseIdentifier: "collection2cell")
    }
    

    

}

extension AmazonViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1{
            return mainimage.count
        }
        
            return productnames1.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1{
            let collection1cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection1cell", for: indexPath) as! FirstCollectionViewCell
            
            collection1cell.upperimg.image = UIImage(named: mainimage[indexPath.row])
            return collection1cell
        }
       
          
                let collection2cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection2cell", for: indexPath) as! SecondCollectionViewCell
                
        collection2cell.productimage.image = UIImage(named: productimages1[indexPath.row])
        collection2cell.productname.text = productnames1[indexPath.row]
                return collection2cell
            
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 2{
            let size = (collectionView.frame.size.width - 10 )/2
            return CGSize(width: size, height: size)
        }
        let size = (collectionView.frame.size)
                    return CGSize(width: size.width, height: size.height)
    }
    }
    
    



