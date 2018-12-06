//
//  ViewController.swift
//  Unit-03-BoutTime-JesseGay
//
//  Created by Jesse Gay on 10/29/18.
//  Copyright © 2018 Jesse Gay. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {
    // MARK: Properties. Global variables go here.
    
    var myGameManager = GameManager()
    // MARK: - Outlets.  Use @IBOutlet collection instead of individual @IBOutlets for every label
    
    @IBOutlet var eventLabels: [UILabel]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        displayEvents()
//            for label in eventLabels {
//            if label.tag == 2 {
//            label.text = "I've been changed"
//            }
        
        }
    
        // MARK: - Helpers
    
    func displayEvents() {
        // get array of random events
        let eventsThisRound = myGameManager.getArrayOfRandomEvents()
        // check contents of eventsThisRound
        print(eventsThisRound)
        // assign them to eventLabels
        for label in eventLabels {
            for event in eventsThisRound {
            label.text = event.eventName
            }
        }
    }
}
    

        
        
    





