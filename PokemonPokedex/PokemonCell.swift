//
//  PokemonCell.swift
//  PokemonPokedex
//
//  Created by Daniel Ramirez on 10/12/16.
//  Copyright © 2016 simpleCoding. All rights reserved.
//

import UIKit

class PokemonCell: UICollectionViewCell {
    
    @IBOutlet weak var pokemoNameLabel: UILabel!
    @IBOutlet weak var pokemonImg: UIImageView!
    
    var pokemon: Pokemon!
    
    func confCell(pokemon:Pokemon){
        
        self.pokemon = pokemon
        
        pokemoNameLabel.text = self.pokemon.pokemonName.capitalized
        pokemonImg.image = UIImage(named: "\(self.pokemon.pokemonId)")
    }
    
}
