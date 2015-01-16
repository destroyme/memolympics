//
//  Words.swift
//  memolympics
//
//  Created by Gabriel Ruiz on 12/23/14.
//  Copyright (c) 2014 Destroy Me Productions. All rights reserved.
//

import Foundation

/*
** This class used to create and store both the words and answers to the word recall game
*/

class WordGame {
    
    // storage for the word index to read from and the answers index
    let memoryWords   : [String]?
    var answers : [String]?
    
    init(listSize: Int) {
        
        self.memoryWords = createList(listSize: listSize) as? [String]
    }
    
    ///////////////
    ////METHODS////
    ///////////////
    
    /*
    ** Creates a randomly ordered list of words, returns nil if it can't create the dictionary
    */
    func createList(#listSize:Int) -> [AnyObject]? {
        
        // create a bundle object
        let bundle = NSBundle.mainBundle()
        
        // locate the path of the dictionary
        let filePath = bundle.pathForResource("dictutf8", ofType:"txt")
        
        // variable to store a potential error finding the file
        var error: NSError?
        
        // store the data from the dictionary
        let dictionaryData = NSString(contentsOfFile: filePath!, encoding: NSUTF8StringEncoding, error: &error)
        
        if error == nil {
            
            // seperate each of the words onto it's own string
            let seperatedData = dictionaryData!.componentsSeparatedByString("\n")

            
            var randomNumb : Int
            var randomNumbIndex = [Int]()
            var randomizedWordList = [String]()
            
            // create a loop by which it randomizes
            for (var i = 0 ; i < listSize ; i++) {
                
                // check if the number is already in the array
                do {
                    // access random points of the array
                    randomNumb = Int(arc4random_uniform(UInt32(seperatedData.count)))

                } while (find(randomNumbIndex, randomNumb) != nil)
                    
                // store number in a counter array
                randomNumbIndex.append(randomNumb)
                
                // get word at that random point and store it in a new 'word list array'
                randomizedWordList.append(seperatedData[randomNumb] as String)
            }
            
            return randomizedWordList
            
        } else {
            
            return nil
            
        }
    }
    
    
    // function to check if the answers are correct
    func checkAnswers () -> Bool {
        return true
    }
    
}
