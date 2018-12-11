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
    var indexOfSelectedEvent = 0 // might need better name
    var alreadyUsedInRound: [Int] = [] // use indices. Redundant?
    var eventsThisRound: [Event] = []
    let eventStruct = EventStruct () // This includes the array of all events which will be used to populate the labels
    
    
    
    // MARK: Methods
    
    // getRandomEvents (and append to eventsThisRound) Wait, maybe this returns [Event]? How do I make it happen 4 times? Maybe func within a fun. getArrayOfRandomEvents() -> [Event] which contains getRandomEvent(), which returns nothing, but adds a random event to eventsThisRound, and is run 4 times.
    
    func getArrayOfRandomEvents() -> [Event] {
    
    
        // Helper Method
        func getRandomEvents() {
            // Get random number. This is an intermediate var (which is checked for repetition within a given round before being assigned to indexOfSelectedEvent)
            var randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: eventStruct.eventCollection.count)
        
            // Check for repetition within round. Index checking may be redundant, might be able to do it with just eventsThisRound.contains...
            while alreadyUsedInRound.contains(randomNumber)  {
                randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: eventStruct.eventCollection.count)
                }
                indexOfSelectedEvent = randomNumber
                // Add index to alreadyAskedQuestions (so repetition checking logic works) and add Event to eventsThisRound (which will be used to populate the labels.)
                alreadyUsedInRound.append(indexOfSelectedEvent)
                eventsThisRound.append(eventStruct.eventCollection[indexOfSelectedEvent])
                }
            // Repeat 4 times. Use eventsPerRound instead of 4 to avoid magic numbers.
            for _ in 1...eventsPerRound {
            getRandomEvents()
            }
            return eventsThisRound
    }

    
    
    // Check final order
    //func isCorrect(//what goes here?)) -> Bool {
    
    /*
     
     
     let arrayFinal = [an array of the dates of the events from the labels]
     But how do I access the date property of each event now that I've separated the event name from the event itself.
     When I move the event names between buttons, there is no longer a link between the actual Event and the name.
     Wait, maybe I preserve the eventsThisRound array, and re-render after every move(if that's even needed.) So each button will increment or decrement the index of its current event.
     
     if arrayFinal.isSorted() = true {} else {}
     Although if I manipulate the positions of eventsThisRound, I might not even need the new var arrayFinal, I can just use eventsThisRound.
     
     ---
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
