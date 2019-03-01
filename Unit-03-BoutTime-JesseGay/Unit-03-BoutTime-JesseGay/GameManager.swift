//
//  GameManager.swift
//  Unit-03-BoutTime-JesseGay
//
//  Created by Jesse Gay on 11/9/18.
//  Copyright © 2018 Jesse Gay. All rights reserved.
//


import GameKit

import Foundation

class GameManager {
    
    // MARK: Properties
    let roundsPerGame = 6
    let eventsPerRound = 4
    var roundsPlayed = 0
    var correctResponses = 0
    var timePerRound = 60
    var roundEnded: Bool = false
    var indexOfSelectedEvent = 0
    var alreadyUsedInRound: [Int] = [] // use indices.
    var eventsThisRound: [Event] = []
    var datesThisRound: [Int] = [] // use datesThisRound.isSorted() to check if correct. Will be modified by checkAnswer() based on position of Events in eventsThisRound at time of checking
    let eventStruct = EventStruct () // This includes the array of all events which will be used to populate the labels
    
    
    // MARK: Methods
    
    // getArrayOfRandomEvents() -> [Event]  Contains getRandomEvent(), which returns nothing, but adds a random event to randomEvents, and is run 4 times.
    
    func getArrayOfRandomEvents() -> [Event] {
        var randomEvents: [Event] = [] // Name this something else (eventsInThisArray?) so it's less confusing
    
        // Helper Method
        func getRandomEvent() {
            
            // Get random number. This is an intermediate var (which is checked for repetition within a given round before being assigned to indexOfSelectedEvent)
            var randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: eventStruct.eventCollection.count)
        
            // Check for repetition within round. Index checking may be redundant, might be able to do it with just randomEvents.contains...
            while alreadyUsedInRound.contains(randomNumber)  {
                randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: eventStruct.eventCollection.count)
                }
                indexOfSelectedEvent = randomNumber
                // Add index to alreadyAskedQuestions (so repetition checking logic works) and add Event to randomEvents (which will be used to populate the labels.)
                alreadyUsedInRound.append(indexOfSelectedEvent)
                randomEvents.append(eventStruct.eventCollection[indexOfSelectedEvent])
                }
            // Repeat 4 times. Use eventsPerRound instead of 4 to avoid magic numbers.
            for _ in 1...eventsPerRound {
            getRandomEvent()
            }
            return randomEvents
    }
    
    // Check final order
    
     func isCorrect(datesThisRound: [Int]) -> Bool {
        if datesThisRound.isSorted() {
            correctResponses += 1 
            return true
            } else {
            return false
            }
        }
}
  
