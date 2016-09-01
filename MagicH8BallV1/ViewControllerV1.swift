//
//  ViewController.swift
//  MagicH8BallV1
//
//  Created by Goran Fak on 6/02/2016.
//  Copyright © 2016 goranfak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var insult: UILabel!
    @IBOutlet weak var victimsName: UITextField!
    
    var randomX = 0
    @IBAction func shake(sender: AnyObject) {
        //let nameNow = ""
        //let nameNowX = String(UTF8String: victimsName.text!)!
      
    
        //Generate Insult
        let insultArray: [String] = ["Sometimes burps which is mistaken for a fart",
            "stinks like a doggies prolapsed poo poo hole",
            "has breathe that Putin wants to bottle for his next homemade chemical missile"]
            //"Has parents who were once featured on COPs for driving their supermarket trolley through a McDonalds drive-Thru",
            //"Should really change their underwear more often",
            //"Has suspicious unwashable stains on the front and backside of their underwear",
            //"Cuts the cheese so bad, birdies fall out of the sky and explode on impact",
            //"has produced 90% of the country's Global warming with butt-hole emmisions",
            //"Is known for frequent cases of 'Ficcups' - Farting Hiccups",
            //"Likes to stay fit and flexible with weekly 'FOGA' classes - Farting Yoga",
            //"Goes to the movies on Pensioner day to try get some old-age-action",
            //"Eats service station hotdogs and wonders why they have chronic diahrea on a daily basis",
            //"Has so much scrap food in their teeth it resembles a compost heap"]
        
        var usedArray = insultArray
        
        //insult Generator
        var insultArrayLength = usedArray.count
        //insultArrayLength = Int(insultArray.count)
        let randomX = Int(arc4random_uniform(UInt32(insultArrayLength)))
        //print(randomX)
        
        var usedInsultCounter = [usedArray.count]
        usedArray.removeAtIndex(randomX)
        
        
        var finalInsult = ""
        finalInsult = String(insultArray[randomX]
        //latest enrty
            //[insultArray removeObjectAtIndex:randomX];
)        //print(insultArray[randomX])
        
        
        //insult.text = "\(nameNowX) \(finalInsult)"
        insult.text = "\(finalInsult)"
    }
    
    func randomNum() {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
    

}

