//
//  WordGameViewController.swift
//  memolympics
//
//  Created by Gabriel Ruiz on 12/29/14.
//  Copyright (c) 2014 Destroy Me Productions. All rights reserved.
//

import UIKit

class WordGameViewController: UIViewController {
    
    ///////////
    //Outlets//
    ///////////
    
    @IBOutlet var rightSwipe: UISwipeGestureRecognizer!
    @IBOutlet var leftSwipe: UISwipeGestureRecognizer!
    
    ///////////
    //Globals//
    ///////////
    
    var index = 0
    // call Word Game
    let currentDictionary = WordGame(listSize: 10)
    var currentLabel : UILabel = UILabel()
    var tempLabel : UILabel = UILabel()
    
    
    /////////////
    //Overides///
    /////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // load countdown
        introGameCountdownSequence()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /////////////
    //Functions//
    /////////////

    @IBAction func changeWordWithSwipe(sender: UISwipeGestureRecognizer) {
        
        // get size of screen to use for animation
        let screenRect : CGRect = UIScreen.mainScreen().bounds
        let screenWidth : CGFloat = screenRect.width
        let screenHeight : CGFloat = screenRect.height
        
        
        switch (sender) {
        // increases the word index if it can, creates a new label text
        case leftSwipe:
        // if the index isn't at the last word, increase count and update label
        // bring in word from right
            if index + 1 != currentDictionary.memoryWords?.count  {
                tempLabel = generateText(text: currentDictionary.memoryWords![++index], x: screenWidth, y: 200)
                changeLabelAnimation(tempLabel, sender: sender)
            } else {
                currentLabel.text = currentDictionary.memoryWords![index]
            }
        // decreases the word index if it can and sets the label text
        case rightSwipe:
            if index > 0 {
                let wordLabelWidth : CGFloat = CGRectGetWidth(currentLabel.frame)
                tempLabel = generateText(text: currentDictionary.memoryWords![--index], x: -wordLabelWidth, y: 200)
                changeLabelAnimation(tempLabel, sender: sender)
            } else {
                currentLabel.text = currentDictionary.memoryWords![index]
            }
        default:
            currentLabel.text = "something weird is happening"
        }
    }
    
    func changeLabelAnimation(movingLabel: UILabel, sender: UISwipeGestureRecognizer) {
        
        // establish variables for label
        let screenWidth    : CGFloat = UIScreen.mainScreen().bounds.width
        let wordLabelMinX  : CGFloat = CGRectGetMinX(currentLabel.frame)
        let wordLabelMinY  : CGFloat = CGRectGetMinY(currentLabel.frame)
        let wordLabelWidth : CGFloat = CGRectGetWidth(currentLabel.frame)
        let wordLabelHeight: CGFloat = CGRectGetHeight(currentLabel.frame)
        
        // animation constraints & preparation
        let duration = 0.5
        let delay = 0.0
        let options = UIViewAnimationOptions.TransitionCrossDissolve | UIViewAnimationOptions.CurveEaseInOut
        self.view.addSubview(movingLabel)
        
        switch (sender) {

        case leftSwipe:
            UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
                movingLabel.frame = self.currentLabel.frame
                self.currentLabel.center = CGPoint(x: -wordLabelWidth, y: wordLabelMinY)

            }, completion: { finished in
                self.currentLabel.removeFromSuperview()
                self.currentLabel = movingLabel
            })
        
        case rightSwipe:
            UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
                movingLabel.frame = self.currentLabel.frame
                self.currentLabel.center = CGPoint(x: wordLabelWidth / 2 + screenWidth, y: wordLabelMinY)
                
                }, completion: { finished in
                    self.currentLabel.removeFromSuperview()
                    self.currentLabel = movingLabel
            })
         
        default:
            println("There's an error :o")
        }
    }
    

   func introGameCountdownSequence() {
        let centerOfScreen = CGPoint(x: UIScreen.mainScreen().bounds.width/2, y: UIScreen.mainScreen().bounds.height/2)

        let countdownLabel = generateText(text: "3", x: 40, y: 90)
        countdownLabel.center = centerOfScreen
        countdownLabel.alpha = 0
        self.view.addSubview(countdownLabel)
        self.currentLabel = generateText(text: self.currentDictionary.memoryWords![self.index], x: 200, y:200)
        self.currentLabel.center = centerOfScreen
    
    
        // animation constraints & preparation
        let duration = 6.0
        let delay = 4.0
        let options = UIViewKeyframeAnimationOptions.CalculationModeLinear
    
        UIView.animateKeyframesWithDuration(duration, delay: delay, options: options, animations: {
            
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 1/6, animations: {
                countdownLabel.alpha = 1.0
            })
            
            UIView.addKeyframeWithRelativeStartTime(1/6, relativeDuration: 1/6, animations: {
                countdownLabel.alpha = 0.0
                countdownLabel.text = "2"
            })
            
            UIView.addKeyframeWithRelativeStartTime(2/6, relativeDuration: 1/6, animations: {
                countdownLabel.alpha = 1.0
            })
            
            UIView.addKeyframeWithRelativeStartTime(3/6, relativeDuration: 1/6, animations: {
                countdownLabel.alpha = 0.0
                countdownLabel.text = "1"
            })
            
            UIView.addKeyframeWithRelativeStartTime(4/6, relativeDuration: 1/6, animations: {
                countdownLabel.alpha = 1.0
            })
            
            UIView.addKeyframeWithRelativeStartTime(5/6, relativeDuration: 1/6, animations: {
                countdownLabel.text = "GO!"
            })
            
        }, completion: { finished in
            countdownLabel.removeFromSuperview()
            self.view.addSubview(self.currentLabel)
        })
    
    }

}
