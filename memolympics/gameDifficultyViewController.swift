//
//  gameDifficultyViewController.swift
//  memolympics
//
//  Created by Gabriel Ruiz on 1/3/15.
//  Copyright (c) 2015 Destroy Me Productions. All rights reserved.
//

import UIKit

class gameDifficultyViewController: UIViewController {

    

    @IBOutlet weak var easyDifficultyButton: UIButton!
    @IBOutlet weak var intermediateDifficultyButton: UIButton!
    @IBOutlet weak var olympicDifficultyButton: UIButton!
    @IBOutlet weak var customDifficultyButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        let viewController: AnyObject = segue.destinationViewController
        
        // Pass the selected object to the new view controller.
    }

}
