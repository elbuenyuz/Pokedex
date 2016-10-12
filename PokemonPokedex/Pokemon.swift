//
//  Pokemon.swift
//  PokemonPokedex
//
//  Created by Daniel Ramirez on 10/12/16.
//  Copyright © 2016 simpleCoding. All rights reserved.
//

import Foundation
import UIKit

class Pokemon{
    
    private var _pokemonName: String!
    private var _pokemonId: Int!
    
    var pokemonName:String{
        return _pokemonName
    }
    var pokemonId:Int{
        return _pokemonId
    }
    
    
    init(pokemonName:String,pokemonId:Int){
        self._pokemonName = pokemonName
        self._pokemonId = pokemonId
    }
}
