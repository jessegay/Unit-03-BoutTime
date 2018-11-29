//
//  ViewController.swift
//  Unit-03-BoutTime-JesseGay
//
//  Created by Jesse Gay on 10/29/18.
//  Copyright © 2018 Jesse Gay. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    // MARK: Properties. Global variables go here.
    
    var myGameManager = GameManager()
    // MARK: - Outlets
    
    // Put @IBOutlets here
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for i in 1...4 {
        getRandomEvent()
        }
    
        // MARK: - Helpers
        
        func getRandomEvent() {
            let currentEvent = myGameManager.eventsInThisRound
            
            // assign currentEvent.EventName to Label. Need to create IBOutlets first.
            // How will I assign sequentially?
        }
        
        
    
    }


}

