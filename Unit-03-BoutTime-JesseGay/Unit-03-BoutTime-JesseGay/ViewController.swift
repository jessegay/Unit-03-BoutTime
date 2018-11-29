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
    
    @IBOutlet var eventLabels: [UILabel]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        for label in eventLabels {
//            if label.tag == 2 {
//            label.text = "I've been changed"
//            }
        
//        let label1 = eventLabels[1]
//        print("\(label1.text)")
        
//        for i in 1...4 {
//        getRandomEvent()
        
        let arrayTest = myGameManager.getArrayOfRandomEvents()
        print(arrayTest)
        }
    
        // MARK: - Helpers
    
    
    
        //func getRandomEvent() {
            //let currentEvent = myGameManager.eventsThisRound
            
            // assign currentEvent.EventName to Label. 
            // How will I assign sequentially? for label in eventLabels and event in eventsThisRound {
            // label.text = event.eventName   }
    }
    
    func displayEvents() {
//        myGameManager.getRandomEvents()
//        let eventsThisRound = myGameManager.eventsThisRound {
//            for label in eventLabels, event in eventsThisRound {
//                label.text = event.eventName
//            }
//
//        }
    }
    
    

        
        
    





