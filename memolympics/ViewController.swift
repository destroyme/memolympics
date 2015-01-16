//
//  ViewController.swift
//  memolympics
//
//  Created by Gabriel Ruiz on 12/23/14.
//  Copyright (c) 2014 Destroy Me Productions. All rights reserved.
//


/*

import UIKit

class ViewController: UIViewController {
    
    ///////////
    //Outlets//
    ///////////
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet var rightSwipe: UISwipeGestureRecognizer!
    @IBOutlet var leftSwipe: UISwipeGestureRecognizer!
    
    ///////////
    //Globals//
    ///////////
    
    var index = 0
    // call Word Game
    let currentDictionary = Words(listSize: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // set the label to the first word
        wordLabel.text = currentDictionary.memoryWords![index]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    /////////////
    //Functions//
    /////////////
    
    @IBAction func changeWordWithSwipe(sender: UISwipeGestureRecognizer) {
        switch (sender) {
            // increases the word index if it can and sets the label text
            case leftSwipe:
                // if the index isn't at the last word, inc
                if index + 1 != currentDictionary.memoryWords?.count  {
                    wordLabel.text = currentDictionary.memoryWords![++index]
                } else {
                    wordLabel.text = currentDictionary.memoryWords![index]
                }
            // decreases the word index if it can and sets the label text
            case rightSwipe:
                if index > 0 {
                    wordLabel.text = currentDictionary.memoryWords![--index]
                } else {
                    wordLabel.text = currentDictionary.memoryWords![index]
                }
            default:
                wordLabel.text = "something weird is happening"
        }
    }
    
    func changeLabelAnimation() {
        
        // create two temporary label
        var templabel = UILabel(frame: CGRectMake(0, 0, 200, 21))
        templabel.center = CGPointMake(160, 284)
        templabel.textAlignment = NSTextAlignment.Center
        templabel.text = "I'am a test label"
        self.view.addSubview(templabel)
        
        // determine if moving left or right
            // set the position of the temp label off the screen
        
        // as you press and hold moving left or right
            // move the position of the temp label towards the direction you are moving your finger
        
            // if you hit a specific position or just swipe, move the temporary label in the center of the screen
        
        
        
        
        
        
        
        
        
        
    }
}

*/