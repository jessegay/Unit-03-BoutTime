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
        // checking on order of labels. Delete. Hmmm, currently order is wrong.
        for label in eventLabels {
            print(label.text!)
        }
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
        } // Do I need this helper or should I just use myGameManager.eventsThisRound = myGameManager.getArrayOfRandomEvents() in viewDidLoad?
    
        func displayEvents() {
        // assign myGameManager.eventsThisRound contents to the labels in storyboard.
        // check contents of eventsThisRound. Can be deleted eventually.
        print(myGameManager.eventsThisRound)
        // assign them to eventLabels
            for (event, label) in zip(myGameManager.eventsThisRound, eventLabels) {
            label.text = event.eventName
            }
        }
    

        
    
    // MARK: Actions
    
    // moveUp() swap item at index(tag+1) with item at index(tag). Then displayEvents again to update display with new order. Testing by cabling it to bottom up button. Almost works, but events are offset by 1. I.e. first item in array is going to label 1, rather than label 0.
    @IBAction func moveUp(_ sender: UIButton) {
        let tagOfButtonPressed = sender.tag
        let tagAbove = tagOfButtonPressed - 1
        myGameManager.eventsThisRound.swapAt(tagOfButtonPressed, tagAbove)
        displayEvents()
    }
    // moveDown()
    @IBAction func moveDown(_ sender: UIButton) {
        let tagOfButtonPressed = sender.tag
        let tagBelow = tagOfButtonPressed + 1
        myGameManager.eventsThisRound.swapAt(tagOfButtonPressed, tagBelow)
        displayEvents()
    }
    // checkAnswer()
    
    func checkAnswer() {
        myGameManager.roundsPlayed += 1
        print("check answer() happened") // for testing. Delete.
        // Create an array of dates of the events from their position AT THIS TIME. Up/down buttons will change order of Events in myGameManger.eventsThisRound.
        for Event in myGameManager.eventsThisRound {
            myGameManager.datesThisRound += [Event.date]
        }
            print(myGameManager.datesThisRound) // for testing. Delete.
        
            
            // Check if they are in order
            if myGameManager.isCorrect(datesThisRound: myGameManager.datesThisRound) {
                // do something
                myGameManager.correctResponses += 1
                print("correct") // for testing. Delete.
                let successButton = UIImage(named: "next_round_success")
                nextRound.setImage(successButton, for: .normal)
            } else {
                // do something else.
                print("incorrect") // for testing. Delete.
             /*   nextRound.image = UIImage(named: "next_round_fail")   // change image to next_round_fail */
                let failButton = UIImage(named: "next_round_fail")
                nextRound.setImage(failButton, for: .normal)
            }
            //nextRound.isEnabled = true // Is this needed? Aren't buttons enabled by default?
            nextRound.isHidden = false
            // Change instructions to "Tap events to learn more"
            instructions.text = "Tap events to learn more"
            // reset myGameManager.datesThisRound to empty.
            myGameManager.datesThisRound = []
        }
    
    
    //  Call checkAnswer() via Shake.
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
         checkAnswer()
        // print("I've been shook") // for testing. Delete.
    }
    
    // nextRound() : Call viewDidLoad(). Hide nextRound button.
    
    @ IBAction func loadNextRound() {
        nextRound.isHidden = true // Hide nextRound button
        viewDidLoad()
        // First loadNextRound works, but second one causes button to freeze on selected (stays dark) and CPU to go to 100%. Events are not reloaded. Probably forgot to reset something.
    }
    
}
        
        
    





