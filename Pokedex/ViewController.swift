//
//  ViewController.swift
//  Pokedex
//
//  Created by YOUNIS on 3/27/16.
//  Copyright © 2016 YOUNIS. All rights reserved.
//

import UIKit
import AVFoundation

//UICollectionViewDataSource: we saying this view we also gonna manage the data that shows up inside our CollectionView
//UICollectionViewDelegateFlowLayout : basically this is the deleget has deleget and func to selt layout on the CollectionView like sizing and spacing , ...
class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collection: UICollectionView!
    
    @IBOutlet weak var searchBat: UISearchBar!
    
    var pokemon = [Pokemon]()
    
    var musicPlayer : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //we say the delegate for this collection is gonna be this class ,,( we own the dataSource and the delegate)
        collection.delegate = self
        collection.dataSource = self
        
        
        
        initAudio()
        pasrePokemonCSV()
    }

    //when the app first load we want to crap all the data from it ,creat punch of pokemon, and load their name into the screen 
    
    func pasrePokemonCSV () {
        
        //crap the file and then run the pasre on it
        
        let path = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")!
        //! we know the file is there 
        
        //we run the pasre which can throw  error 
        
        do {
            //we crap the path of the csv file,,parse it ti csv
            let csv = try CSV(contentsOfURL: path)
            
            //crap the row out of csv file
            let rows = csv.rows
            
            for row in rows {
                //each row is dictionary
                
                let pokeId = Int(row["id"]!)!
                let name = row["identifier"]!
                
                let poke = Pokemon(name: name, pokedex: pokeId)
                
                pokemon.append(poke)
                
            }
            
        }catch let err as NSError{
            //if there is a problem
            print(err.debugDescription)
        }
        
    }
    
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        //crap one that not be used rigth now (off the screen )  let's crap it and put it bak on the screen ,and put stuff in it 
        //indexPath is the current index of the row
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokeCell", forIndexPath: indexPath) as? PokeCell {
            
            let poke = pokemon[indexPath.row]
            cell.configureCell(poke)
            
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
        return pokemon.count
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //we want to set the size of the grigd so it look nice

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSize(width: 105, height: 105)
        
    }
    
    
    func initAudio(){
       
        let path = NSBundle.mainBundle().pathForResource("music", ofType: "mp3")!
        
        do {
            
            musicPlayer = try AVAudioPlayer(contentsOfURL: NSURL(string: path)!)
            musicPlayer.prepareToPlay()
            
            //we want infinite loop
            musicPlayer.numberOfLoops = -1
            musicPlayer.play()
            
        }catch let err as NSError {
            print(err.debugDescription)
        }
        
        
    }
    
    
    
    @IBAction func musicBtnPressed(sender: UIButton!) {
        
        //if playing
        if musicPlayer.playing {
            musicPlayer.stop()
            sender.alpha = 0.3
        }else{
            musicPlayer.play()
            sender.alpha = 1.0
        }
    }
}

