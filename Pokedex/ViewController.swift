//
//  ViewController.swift
//  Pokedex
//
//  Created by YOUNIS on 3/27/16.
//  Copyright © 2016 YOUNIS. All rights reserved.
//

import UIKit

//UICollectionViewDataSource: we saying this view we also gonna manage the data that shows up inside our CollectionView
//UICollectionViewDelegateFlowLayout : basically this is the deleget has deleget and func to selt layout on the CollectionView like sizing and spacing , ...
class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //we say the delegate for this collection is gonna be this class ,,( we own the dataSource and the delegate)
        collection.delegate = self
        collection.dataSource = self
        
    }

    
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        //crap one that not be used rigth now (off the screen )  let's crap it and put it bak on the screen ,and put stuff in it 
        //indexPath is the current index of the row
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokeCell", forIndexPath: indexPath) as? PokeCell {
            
            let pokemon = Pokemon(name: "test", pokedex: indexPath.row)
            cell.configureCell(pokemon)
            
            return cell
        }else {
            return UICollectionViewCell()
            //return generic one with nothing in it
        }
        
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    

    //we need to know how many item in each section
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 718
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //we want to set the size of the grigd so it look nice

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSize(width: 105, height: 105)
        
    }
}

