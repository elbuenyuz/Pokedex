//
//  ViewController.swift
//  PokemonPokedex
//
//  Created by Daniel Ramirez on 10/11/16.
//  Copyright © 2016 simpleCoding. All rights reserved.
//

import UIKit
import AVFoundation
import Firebase

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UISearchBarDelegate {
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var pokemon : Pokemon!
    var musicPlayer : AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collection.delegate = self
        collection.dataSource = self
        
        //hacemos referencia a la base de datos
        let ref = FIRDatabase.database().reference()
        
        //ponemos un observador que nos imprimira lo que tengamos en la DB
        ref.observe(.childAdded,with: { (snapshot) in
            
            print("this is what is in the Database \(snapshot)")
            
        })
        
        //anadmios un newchild y automaticamente un setKey
        ref.child("setKeyValues").childByAutoId().setValue("this is the value")
        
        //nuevo child vvalue sin key automatica
        ref.child("newVa").setValue("yaaas")
        
        pokemon = Pokemon(pokemonName: "daniel", pokemonId: 10)
        initMusic()
    }

//func to start music
    func initMusic(){
        
        let path = Bundle.main.path(forResource: "music", ofType: "mp3")!
        
        do{
            
            musicPlayer = try! AVAudioPlayer(contentsOf: NSURL(string: path)! as URL)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = 1
            musicPlayer.play()
            
            
        }catch let err as NSError{
            print(err.debugDescription)
        }
    }
    
    @IBAction func musicButtonPressed(_ sender: UIButton) {
        
        if musicPlayer.isPlaying{
            
            musicPlayer.stop()
            sender.alpha = 0.2
            
            
        }else{
            musicPlayer.play()
            sender.alpha = 1.0
            
        }
        
    }
    
//Func colllection
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 718
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collection.dequeueReusableCell(withReuseIdentifier: "PokemonCell", for: indexPath) as? PokemonCell{
            
            cell.confCell(pokemon: pokemon)
            return cell
        }else{
            return UICollectionViewCell()
        }
        
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 105, height: 105)
    }
}

