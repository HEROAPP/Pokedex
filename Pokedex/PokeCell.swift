//
//  PokeCell.swift
//  Pokedex
//
//  Created by YOUNIS on 3/28/16.
//  Copyright © 2016 YOUNIS. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {

    @IBOutlet weak var thumbImg :UIImageView!
    @IBOutlet weak var nameLbl :UILabel!
    
    //we got to store pokemon object , so whenever you new cell created ,we have actuall class to hold the data ,,that we don't have to use copy like name ,description,...

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //every View has layer
        layer.cornerRadius = 2.0
        
    }
   
    
    
    var pokemon :Pokemon!
    
    func configureCell (pokemon:Pokemon){
        //we pass the pokemon object so the cell can be used over and over 
        self.pokemon = pokemon
        
        nameLbl.text = self.pokemon.name.capitalizedString
        thumbImg.image = UIImage(named: "\(self.pokemon.pokedex)")
        //all are image are number
    }
}
