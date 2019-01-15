//
//  GameManager.swift
//  Unit-03-BoutTime-JesseGay
//
//  Created by Jesse Gay on 11/9/18.
//  Copyright © 2018 Jesse Gay. All rights reserved.
//

// "Round" in unit 2 is now "Game". "Question" in unit 2 is now "Round"

import GameKit

import Foundation

class GameManager {
    
    // MARK: Properties
    let roundsPerGame = 6
    let eventsPerRound = 4
    var roundsPlayed = 0
    var correctResponses = 0
    var roundEnded: Bool = false
    var indexOfSelectedEvent = 0 // might need better name
    var alreadyUsedInRound: [Int] = [] // use indices. Redundant?
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
     
     /*
     let datesThisRound = [an array of the dates of eventsThisRound]
     It will be modified at the time of checkAnswer() since that will reflect the order at that moment.
     Use eventsThisRound array as source of truth. Each button will increment or decrement the index of its current event and displayEvents() after every move (to update the sppearance of the labels.)
   
     ---
     How to check if sorted:
     2 options from: https://stackoverflow.com/questions/24602595/extending-array-to-check-if-it-is-sorted-in-swift
     
     Simple:
     extension Array where Element : Comparable {
     func isSorted() -> Bool {
     guard self.count > 1 else {
     return true
     }
     
     for i in 1..<self.count {
     if self[i-1] > self[i] {
     return false
     }
     }
     return true
     }
     }
     
     With arguments for type of sort:
     extension Array where Element: Comparable {
     func isSorted(by isOrderedBefore: (Element, Element) -> Bool) -> Bool {
     for i in stride(from: 1, to: self.count, by: 1) {
     if !isOrderedBefore(self[i-1], self[i]) {
     return false
     }
     }
     return true
     }
     }
     
     
     
     
     
     */
    // if historicalEveent1.date > historicalEvent2.date etc. 
    
    
}
