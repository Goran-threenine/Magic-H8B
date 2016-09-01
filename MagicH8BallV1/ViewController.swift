//
//  ViewController.swift
//  MagicH8BallV1
//
//  Created by Goran Fak on 6/02/2016.
//  Copyright © 2016 goranfak. All rights reserved.
//

import UIKit
import GoogleMobileAds
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer = AVAudioPlayer()
    var randomX = 0
    var i = 0
    var bannerReload = 10
    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var joke: UILabel!
    @IBOutlet weak var victimsName: UITextField!
    @IBOutlet weak var playAgain: UIButton!
    @IBOutlet weak var joke1: UITextView!
    @IBOutlet weak var shake: UIButton!
    @IBOutlet weak var think: UILabel!
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if event?.subtype == UIEventSubtype.MotionShake {
            shakeResponse();
            shakeSound();
            }
        }
    
    func shakeSound()
    {
        let audioPath = NSBundle.mainBundle().pathForResource("WaterShake1", ofType: "mp3")!
            do {
                try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
                player.play()
            } catch {
                //error here
            }
    }
    
    //Generate Joke
    var jokeArray: [String] = ["Sometimes burps which is mistaken for a fart",
        "has breathe that Putin wants to bottle for his next homemade chemical missile",
        "Should really change their underwear more often",
        "Cuts the cheese so bad, birdies fall out of the sky and explode on impact",
        "has produced 90% of the country's Global warming with butt emmisions",
        "Is known for frequent cases of 'Ficcups' - Farting Hiccups",
        "Likes to stay fit and flexible with weekly 'FOGA' classes - Farting Yoga",
        "Eats service station hotdogs - even the ones with a bandaid on them"]
    
    var usedArray: [String] = []
    //let usedArrayCount = usedArray.count

    @IBAction func shakeReset(sender: AnyObject) {
        usedArray = jokeArray
        print(usedArray.count)
        shake(self)
        playAgain.hidden = true
        loadBanner()
    }
    
    @IBAction func shake(sender: AnyObject) {
        shakeResponse();
        
    }
    
    
    func shakeResponse(){
        if i < usedArray.count && usedArray.count == bannerReload {
            print("hit 10 in teh array")
            var jokeArrayLength = usedArray.count
            let randomX = Int(arc4random_uniform(UInt32(jokeArrayLength)))
            var finalJoke = ""
            finalJoke = String(usedArray[randomX])
            usedArray.removeAtIndex(randomX)
            joke1.text = "\(finalJoke)"
            print(usedArray.count)
            loadBanner()
 
        }
        
        else if i < usedArray.count {
            var jokeArrayLength = usedArray.count
            let randomX = Int(arc4random_uniform(UInt32(jokeArrayLength)))
            var finalJoke = ""
            finalJoke = String(usedArray[randomX])
            usedArray.removeAtIndex(randomX)
            joke1.text = "\(finalJoke)"
            print(usedArray.count)
            }
            else {
                    joke1.text = "I'm all out of hate baby"
                    playAgain.hidden = false

                    }
        }

    override func viewDidLoad() {
        
        //formatting
        joke1.layer.borderWidth = 1.2
        joke1.layer.cornerRadius = 8
        joke1.layer.borderColor = UIColor.grayColor().CGColor
        //Top LEFT BOTTOM RIGHT
        joke1.textContainerInset = UIEdgeInsetsMake(40,15,10,15);
        
        //think.layer.cornerRadius = 8;
        //think.layer.borderWidth = 1;
        //think.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        shake.layer.cornerRadius = 8;
        shake.layer.borderWidth = 1;
        shake.layer.borderColor = UIColor.grayColor().CGColor
        //shake.backgroundColor = UIColor.redColor()
        
        super.viewDidLoad()
        usedArray = jokeArray
        playAgain.hidden = true
        print("Google Mobile Ads SDK version: \(GADRequest.sdkVersion())")
        loadBanner()
        //Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadBanner() {
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.loadRequest(GADRequest())
        print("banner loaded")
    }
    
    

}

