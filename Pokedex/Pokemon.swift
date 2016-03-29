//
//  Pokemon.swift
//  Pokedex
//
//  Created by YOUNIS on 3/28/16.
//  Copyright © 2016 YOUNIS. All rights reserved.
//

import Foundation
//we need to have some type of data,, we need pokemon object that store pokemon name and pokeindex
class Pokemon {
    
    private var _name :String!
    private var _pokedexId : Int!
    
    var name : String {
        return _name
    }
    
    var pokedex :Int {
    return _pokedexId
    }
    
    //pass the data
    init( name:String ,pokedex:Int ){
        self._name = name
        self._pokedexId = pokedex
    }
}