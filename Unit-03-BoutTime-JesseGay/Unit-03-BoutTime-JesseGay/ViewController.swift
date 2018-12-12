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
        
        // FIXME: displayEvents() works, but it actually does 2 things, get random events and display them. Does display need to be broken out into its own function so it can be repeatedly called each time the events are moved?
        
        displayEvents()

        
        // Test:           for label in eventLabels {
//            if label.tag == 2 {
//            label.text = "I've been changed"
//            }
        
        }
    
        // MARK: - Helpers
    
    
    func displayEvents() {
        // get array of random events
        let eventsThisRound = myGameManager.getArrayOfRandomEvents()
        // check contents of eventsThisRound. Can be delted eventually.
        print(eventsThisRound)
        // assign them to eventLabels
            for (event, label) in zip(eventsThisRound, eventLabels) {
            label.text = event.eventName
            }
        }
    
    // MARK: Actions
    
    // This might need to be in an if statement if motion == .motionShake as per https://www.ioscreator.com/tutorials/detect-shake-gestures-ios-tutorial-ios10
    
    @IBAction func checkAnswer(_ sender: UIEvent?) {
        myGameManager.roundsPlayed += 1
        
        // Create an array of dates of the events from their position AT THIS TIME. Should this be it's own method?
        for Event in myGameManager.eventsThisRound {
            var datesThisRound: [Int] = []
            datesThisRound += [Event.date]
            
            // Check if they are in order
            if myGameManager.isCorrect(datesThisRound: datesThisRound) {
                // do something
            } else {
                // do something else.
            }
        
        }
        
    }
}

        
        
    





