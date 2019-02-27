//
//  ViewController.swift
//  Unit-03-BoutTime-JesseGay
//
//  Created by Jesse Gay on 10/29/18.
//  Copyright © 2018 Jesse Gay. All rights reserved.
//

import UIKit
import GameKit
import SafariServices

class ViewController: UIViewController, SFSafariViewControllerDelegate {
    // MARK: Properties. Global variables go here.
    var myGameManager = GameManager()
    var timerDuration: Int = 60
    var timer = Timer()
    
   
    // MARK: - Outlets.  Use @IBOutlet collection instead of individual @IBOutlets for every label
    @IBOutlet var eventViews: [UIView]!

    // Connect historical labels to this outlet in order
    @IBOutlet var eventLabels: [UILabel]!
    
    // Tap gesture recognizers for the 4 eventViews
    @IBOutlet var eventTapGestures: [UITapGestureRecognizer]!
    
    // nextRound button
    @IBOutlet weak var nextRound: UIButton!
    
    // instructions
    @IBOutlet weak var instructions: UILabel!
    
    // countdown timer
    @IBOutlet weak var labelCountdown: UILabel!
    
    // checkFinalScore button
    @IBOutlet weak var checkFinalScore: UIButton!
    
    // moveEventButtons
    @IBOutlet var moveEventButtons: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Testing that game properties get reset after returning from finalScoreView.
        print("I've been loaded. \(myGameManager.roundsPlayed) rounds have been played ")
        loadRound()
        
        // Round corners of event views. Use collection rather than doing each one separately.
        for eventView in eventViews {
            eventView.layer.cornerRadius = 4
            }
        }
    
        // MARK: - Helpers
        func getRandomEvents() {
        myGameManager.eventsThisRound = myGameManager.getArrayOfRandomEvents()
        }
    
        func displayEvents() {
        // Assign myGameManager.eventsThisRound contents to the labels in storyboard.
            // Check contents of eventsThisRound. Can use to cheat by checking dates :)
        print(myGameManager.eventsThisRound)
        // assign them to eventLabels
            for (event, label) in zip(myGameManager.eventsThisRound, eventLabels) {
            label.text = event.eventName
            }
        }
    
        // Assign tags of events in eventsThisRound to eventViews. Then use eventView.tag to refer back to the event to know which view was pressed to get URL. Call this upon first load, and every time someone moves an event.
        func idToTag() {
            for (event, view) in zip(myGameManager.eventsThisRound, eventViews) {
                view.tag = event.id
            }
        }
    
    // MARK: - Actions
    @ IBAction func loadRound() {
        // reset myGameManager.alreadyUsedInRound to empty
        myGameManager.alreadyUsedInRound = []
        // reset myGameManager.eventsThisRound to empty
        myGameManager.eventsThisRound = []
        // reset myGameManager.datesThisRound to empty
        myGameManager.datesThisRound = []
        // reset timer
        timerDuration = myGameManager.timePerRound
        // Display counter value
        labelCountdown.text = String(timerDuration)
        // Create Timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
        
        // Create array of 4 random, non-repeating events
        getRandomEvents()
        // Display them on the eventLabels
        displayEvents()
        // Assign Event.id to eventViews.tag
        idToTag()
        // Update instructions
        instructions.text = "Arrange these #1 hits in order of release (oldest on top.) Shake to complete"
        // Show counter
        labelCountdown.isHidden = false
        // Hide nextRound button
        nextRound.isHidden = true
        // Hide checkFinalScore button
        checkFinalScore.isHidden = true
        // reset roundEnded so checkAnswer() can run in response to shake.
        myGameManager.roundEnded = false
        // re-enable up/down buttons
        for button in moveEventButtons {
            button.isUserInteractionEnabled = true
        }
        // Disable [eventTapGestures] so players can't check dates until round is done.
        for eventTapGesture in eventTapGestures {
            eventTapGesture.isEnabled = false
        }
        // MARK: Testing tag assignment upon load.
        for view in eventViews {
            print(view.tag)
        }
    }
    // moveUp() swap item at index(tag+1) with item at index(tag). Then displayEvents again to update display with new order.
    // Connect all up buttons to moveUp, and down buttons to moveDown. Remember buttons need tags 0-3 for the logic to work.
    
    @IBAction func moveUp(_ sender: UIButton) {
        let tagOfButtonPressed = sender.tag
        let tagAbove = tagOfButtonPressed - 1
        myGameManager.eventsThisRound.swapAt(tagOfButtonPressed, tagAbove)
        displayEvents()
        idToTag()
        // MARK: Testing tag assignment upon moveUp().
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
        // MARK: Testing tag assignment upon moveDown().
        for view in eventViews {
            print("tags are \(view.tag)")
            }
        }
    // checkAnswer()
    
    func checkAnswer() {
        myGameManager.roundsPlayed += 1
        print("checkAnswer() happened") // for testing.
        // Create an array of dates of the events from their position AT THIS TIME. Up/down buttons will change order of Events in myGameManger.eventsThisRound.
        for Event in myGameManager.eventsThisRound {
            myGameManager.datesThisRound += [Event.date]
        }
            print(myGameManager.datesThisRound) // for testing.
        
            // Check if they are in order
            let datesThisRound = myGameManager.datesThisRound
            if myGameManager.isCorrect(datesThisRound: datesThisRound) {
                print("correct") // for testing.
                let successButton = UIImage(named: "next_round_success")
                nextRound.setImage(successButton, for: .normal)
            } else {
                print("incorrect") // for testing.
              // change image to next_round_fail
                let failButton = UIImage(named: "next_round_fail")
                nextRound.setImage(failButton, for: .normal)
            }
        
            // Hide counter
            labelCountdown.isHidden = true
            // Show nextRound button
            nextRound.isHidden = false
            // Change instructions to "Tap events to learn more"
            instructions.text = "Tap events to learn more"
            // Enable [eventTapGestures] so players can open SafariVC.
            for eventTapGesture in eventTapGestures {
                eventTapGesture.isEnabled = true
            }
        
            // disable moveEventButtons
            for button in moveEventButtons {
                button.isUserInteractionEnabled = false
            }
      
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
        if myGameManager.roundEnded == false, motion == .motionShake {
          checkAnswer()
          myGameManager.roundEnded = true
          // Stop the timer
          timer.invalidate()
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
    
    // Get URL of event of label selected. Then pass this to the safariWebView
    @IBAction func openURLOfEventTapped(_ sender: UITapGestureRecognizer) {
        var url: URL?
        guard let tag = sender.view?.tag else { return }
        for event in myGameManager.eventsThisRound {
            if event.id == tag {
              url = getURLForEvent(event)
            }
        }
        if let url = url {
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
        safariVC.delegate = self
        }
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func getURLForEvent(_ event: Event) -> URL? {
        guard let url = URL(string: event.url) else { return nil}
        return url
    }
}
        

