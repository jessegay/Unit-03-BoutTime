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
        // Create array of 4 random, non-repeating events
        getRandomEvents()
        // Display them on the eventLabels
        displayEvents()

        
        }
    
        // MARK: - Helpers
        func getRandomEvents() {
        myGameManager.eventsThisRound = myGameManager.getArrayOfRandomEvents()
        }
    
        func displayEvents() {
        // get array of random events. Is it weird that I'm using the same name as the var eventsThisRound in the GameManagerdefinition? Yes. Fixed (I think) by breaking out the getting of the array.
        //let eventsThisRound = myGameManager.getArrayOfRandomEvents()
        // check contents of eventsThisRound. Can be deleted eventually.
        print(myGameManager.eventsThisRound)
        // assign them to eventLabels
            for (event, label) in zip(myGameManager.eventsThisRound, eventLabels) {
            label.text = event.eventName
            }
        }
    
  
    // MARK: Actions
    
    // checkAnswer() might need to be in an if statement if motion == .motionShake as per https://www.ioscreator.com/tutorials/detect-shake-gestures-ios-tutorial-ios10
    
    @IBAction func checkAnswer(_ sender: UIEvent?) {
        myGameManager.roundsPlayed += 1
        
        // Create an array of dates of the events from their position AT THIS TIME. Should this be it's own method? Up/down buttons will change order of Events in myGameManger.eventsThisRound.
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

        
        
    





