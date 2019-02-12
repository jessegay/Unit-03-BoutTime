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
    var timerDuration: Int = 60
    var timer = Timer()
    
    // MARK: - Outlets.  Use @IBOutlet collection instead of individual @IBOutlets for every label
    
    @IBOutlet var eventViews: [UIView]!
    // Connect historical labels to this outlet in order
    @IBOutlet var eventLabels: [UILabel]!
    
    
    @IBOutlet weak var nextRound: UIButton!
    

    @IBOutlet weak var instructions: UILabel!
    
    @IBOutlet weak var labelCountdown: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadRound()
        
        // Round corners of event views. Use collection rather than doing each one separately.
        for eventView in eventViews {
            eventView.layer.cornerRadius = 4
            }
        
        // Programatically make align y position of labelCountdown and nextRound. For some reason I couldn't select nextRound as an alignment parameter from IB, I could only see stack views and top level stuff. This doesn't seem to work so I've just manually pinned the labelCountdown below the allEventsStack.
        
        labelCountdown.center.y = nextRound.center.y
        
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
    
    // Connect all up buttons to moveUp, and down buttons to moveDown. Remember buttons need tags 0-3 for the logic to work.
    
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
        
            // reset myGameManager.alreadyUsedInRound to empty
            myGameManager.alreadyUsedInRound = []
            // reset myGameManager.eventsThisRound to empty
            myGameManager.eventsThisRound = []
            // reset myGameManager.datesThisRound to empty
            myGameManager.datesThisRound = []
            // reset timer
            timerDuration = 60
            // Testing roundsPlayed
            print("You've played \(myGameManager.roundsPlayed) rounds")
            print("You have \(myGameManager.correctResponses) correct responses")
        }
    
    
    //  Call checkAnswer() via Shake.
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if myGameManager.roundEnded == false {
          checkAnswer()
          myGameManager.roundEnded = true
          // timerDuration = 60 // reset timer
          timer.invalidate() // Stop the timer
            
        } else {
          print("You need to play the next round to re-enable Shake!")
        }
        
        
        // End game if all rounds are complete.
        if myGameManager.roundsPlayed == myGameManager.roundsPerGame {
            // displayScore()
            print("game over") // for testing, delete
            nextRound.isHidden = true // Hide button so they can't keep playing. Eventually this will trigger the FinalScore view so this may be redundant. Circle back once FinalScore is in place.
        } else {
            // do something else (or just return?)
        }
        // self.view.isUserInteractionEnabled = false // Could this be a clue about deactivating motionEnded until next round?
        
    }
 
    // nextRound() : Call viewDidLoad(). Hide nextRound button.
    
    @ IBAction func loadRound() {
        // Set counter to :60 so it displays correctly after reloading
        labelCountdown.text = String(timerDuration)
        // Create Timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)

        // Create array of 4 random, non-repeating events
        getRandomEvents()
        // Display them on the eventLabels
        displayEvents()
        // Update instructions
        instructions.text = "Shake to complete"
        // Hide nextRound button
        nextRound.isHidden = true
        // reset roundEnded so checkAnswer() can run in response to shake.
        myGameManager.roundEnded = false
        
        // FIXME: If roundsPlayed = roundsPerGame labelCountdown.isHidden = true
        // FIXME: Should all the property resets go here instead of in checkAnswer?
    }
    
    // Counter helper method
    @objc func counter() {
        timerDuration -= 1
        labelCountdown.text = String(timerDuration)
        
        if timerDuration == 0 {
            // Stop the timer
            // FIXME: This may be redundant if I include .invalidate and timer reset in checkAnswer()
            timer.invalidate()
            // Check Answer
            checkAnswer()
            myGameManager.roundEnded = true
        }
        
    }
    // FIXME: Play another game
    // FIXME: Add displayScore()
    
}
        
        
    





