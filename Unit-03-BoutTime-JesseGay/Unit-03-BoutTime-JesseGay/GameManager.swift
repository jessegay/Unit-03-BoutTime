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
    
    // getRandomEvents (and append to eventsThisRound? or should this be separate func?.) Wait, maybe this returns [Event]? How do I make it happen 4 times? Maybe func within a fun. getArrayOfRandomEvents() -> [Event] which contains getRandomEvent(), which returns nothing, but adds a random event to eventsThisRound, and is run 4 times.
    
    func getArrayOfRandomEvents() -> [Event] {
    
    
    // Helper Method
    func getRandomEvents() {
        // Get random number. This is an intermediate var (which is checked for repetition within a given round before being assigned to indexOfSelectedEvent)
        var randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: eventStruct.eventCollection.count)
    
    // Check for repetition within round
        while alreadyUsedInRound.contains(randomNumber)  {
            randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: eventStruct.eventCollection.count)
            }
            indexOfSelectedEvent = randomNumber
            // Add to alreadyAskedQuestions
            alreadyUsedInRound.append(indexOfSelectedEvent)
            eventsThisRound.append(eventStruct.eventCollection[indexOfSelectedEvent])
            // return the ARRAY of questions ? (rather than just a single question)
       //     return eventsThisRound
            }
        getRandomEvents()
        getRandomEvents()
        
        return eventsThisRound
    }
    // Run this^ code 4 times? Maybe in viewDidLoad () {
    // for i in 1...4 {displayRandomEvent()}} maybe not. Try it here so calling it once returns an [Event] of the correct size.
    
    // Check final order
    //func isCorrect(//what goes here?)) -> Bool {
    
    // if historicalEveent1.date > historicalEvent2.date etc. 
    
    
    
    
    
    
    
}
