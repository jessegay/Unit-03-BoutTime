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
    
    @IBOutlet weak var nextRound: UIButton!
    

    @IBOutlet weak var instructions: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Create array of 4 random, non-repeating events
        getRandomEvents()
        // Display them on the eventLabels
        displayEvents()
        instructions.text = "Shake to complete"
        nextRound.isHidden = true
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
    
    // checkAnswer()
    
    func checkAnswer() {
        myGameManager.roundsPlayed += 1
        print("check answer() happened") // for testing. Delete.
        // Create an array of dates of the events from their position AT THIS TIME. Up/down buttons will change order of Events in myGameManger.eventsThisRound.
        for Event in myGameManager.eventsThisRound {
            var datesThisRound: [Int] = []
            datesThisRound += [Event.date]
            print(datesThisRound) // for testing. Delete.
            
            // For loop needs to end here, but datesThisRound needs to be passed to isCorrect(). 
            
            // Check if they are in order
            if myGameManager.isCorrect(datesThisRound: datesThisRound) {
                // do something
                myGameManager.correctResponses += 1
                print("incorrect") // for testing. Delete.
            } else {
                // do something else.
                print("incorrect") // for testing. Delete.
             /*   nextRound.image = UIImage(named: "next_round_fail")   // change image to next_round_fail */
                let failButton = UIImage(named: "next_round_fail")
                nextRound.setImage(failButton, for: .normal)
            }
            //nextRound.isEnabled = true // Is this needed? Aren't buttons enabled by default?
            nextRound.isHidden = false
        }
    }
    
    //  Call checkAnswer() via Shake.
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
         checkAnswer()
        // print("I've been shook") // for testing. Delete.
    }
}

        
        
    





