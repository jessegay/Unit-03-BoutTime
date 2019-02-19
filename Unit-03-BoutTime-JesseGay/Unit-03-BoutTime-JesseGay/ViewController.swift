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
    // FIXME: Add tap gesture recognizers to the views
    // Connect historical labels to this outlet in order
    @IBOutlet var eventLabels: [UILabel]!
    
    // Tap gesture recognizers for the 4 eventViews
    @IBOutlet var eventTapGestures: [UITapGestureRecognizer]!
    
    @IBOutlet weak var nextRound: UIButton!
    
    @IBOutlet weak var instructions: UILabel!
    
    @IBOutlet weak var labelCountdown: UILabel!
    
    @IBOutlet weak var checkFinalScore: UIButton!
    //@IBOutlet weak var score: UILabel!
    
    @IBOutlet weak var resultsStack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // FIXME: Delete this print test statement. Testing that game properties get reset after returning from finalScoreView.
        print("I've been loaded. \(myGameManager.roundsPlayed) round have been played ")
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
        // If I have to change the eventLabels to eventButtons, then I guess this would just become for (event, button) in zip(myGameManager.eventsThisRound, eventButtons) {button.title = event.eventName}
    
        // Assign tags of events in eventsThisRound to eventViews. Then use eventView.tag to refer back to the event to know which view was pressed to get URL. Call this upon first load, and every time someone moves an event.
        func idToTag() {
            for (event, view) in zip(myGameManager.eventsThisRound, eventViews) {
                view.tag = event.id
            }
        }
    
    // MARK: Actions
    @ IBAction func loadRound() {
        // Set counter to :60 so it displays correctly after reloading
        labelCountdown.text = String(timerDuration)
        // Create Timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
        
        // Create array of 4 random, non-repeating events
        getRandomEvents()
        // Display them on the eventLabels
        displayEvents()
        // Assign Event.id to eventViews.tag
        idToTag()
        // Update instructions
        instructions.text = "Shake to complete"
        // Hide nextRound button
        nextRound.isHidden = true
        // Hide checkFinalScore button
        checkFinalScore.isHidden = true
        // reset roundEnded so checkAnswer() can run in response to shake.
        myGameManager.roundEnded = false
        
        // FIXME: Testing tag assignment upon load. Delete.
        for view in eventViews {
            print(view.tag)
        }
        

    }
    // moveUp() swap item at index(tag+1) with item at index(tag). Then displayEvents again to update display with new order.
    // FIXME: Occasionally get indexOutOfRange error from bottonUp button. Can't reproduce. Seemed to happen when I was clicking very rapidly. Could this have overwhelmed simulator?
    // Connect all up buttons to moveUp, and down buttons to moveDown. Remember buttons need tags 0-3 for the logic to work.
    
    @IBAction func moveUp(_ sender: UIButton) {
        let tagOfButtonPressed = sender.tag
        let tagAbove = tagOfButtonPressed - 1
        myGameManager.eventsThisRound.swapAt(tagOfButtonPressed, tagAbove)
        displayEvents()
        idToTag()
        // FIXME: Testing tag assignment upon moveUp(). Delete.
        for view in eventViews {
            print("tags are \(view.tag)")
            }
        }
    // moveDown()
    @IBAction func moveDown(_ sender: UIButton) {
        let tagOfButtonPressed = sender.tag
        let tagBelow = tagOfButtonPressed + 1
        myGameManager.eventsThisRound.swapAt(tagOfButtonPressed, tagBelow)
        displayEvents()
        idToTag()
        // FIXME: Testing tag assignment upon moveDown(). Delete.
        for view in eventViews {
            print("tags are \(view.tag)")
            }
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
              // change image to next_round_fail
                let failButton = UIImage(named: "next_round_fail")
                nextRound.setImage(failButton, for: .normal)
            }
            // Show nextRound button
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
        
        // show/hide end of game buttons
        if myGameManager.roundsPlayed == myGameManager.roundsPerGame {
            print("game over") // for testing
            labelCountdown.isHidden = true
            nextRound.isHidden = true
            checkFinalScore.isHidden = false
            // MARK: performSegue(withIdentifier: "finalScoreSegue", sender: nil) // < could use this to show score automatically (as opposed to requiring clicking of checkScore)
            }
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
 
    // Pass final score to finalScoreViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "finalScoreSegue" {
            let finalScoreViewController = segue.destination as! FinalScoreViewController
            finalScoreViewController.score = "\(myGameManager.correctResponses) / \(myGameManager.roundsPerGame)"
        }
    }
    
    
  
    // FIXME: Get URL of event of label selected. Then pass this to the safariWebView. Not sure if I need self. here.
    // This is supposed to be a function to get the URL of a button. Will have to modify to work with tapGestureRecognizer
    // Actually this is probably not the right road. Going to try another way based on Dennis' suggestion.
    func getURLofEventSelected(_ sender: UIButton) -> String {
        var url = ""
        let eventName = sender.title(for: .normal) // < this needs to be title of button clicked.
        for event in myGameManager.eventStruct.eventCollection {
            if event.eventName == eventName {
               url = event.url
            }
        }
        return url
    }
    
    // FIXME: Tap Gesture Recognizer Actions.
    // Currently all 4 gesture zones are connected here, but they just call a print statement. How do I access the properties of the event in the view?
    
    @IBAction func eventViewTapped(_ sender: UITapGestureRecognizer) {
        let tapProperty = sender.numberOfTapsRequired
        print(tapProperty)
    }
    
    
    
}
        
        

// Testing
//let test = self.myGameManager.eventStruct.eventCollection[2].url
//let url = test.url
//return test





