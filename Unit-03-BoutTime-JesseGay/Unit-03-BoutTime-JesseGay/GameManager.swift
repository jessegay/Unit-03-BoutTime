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
    var roundsPlayed = 0
    var correctResponses = 0
    var indexOfSelectedEvent = 0 // might need better name
    var alreadyUsedInRound: [Int] = [] // use indices. Redundant?
    var eventsInThisRound: [Event] = []
    let eventStruct = EventStruct () // This includes the array of all events which will be used to populate the labels
    
    
    
    // MARK: Methods
    
    // getRandomEvent
    func getRandomEvent() -> Event {
        // Get random number. This is an intermediate var (which is checked for repetition within a given round before being assigned to indexOfSelectedEvent)
        var randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: eventStruct.eventCollection.count)
    
    // Check for repetition within round
    while alreadyUsedInRound.contains(randomNumber)  {
    randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: eventStruct.eventCollection.count)
    }
    indexOfSelectedEvent = randomNumber
    // Add to alreadyAskedQuestions
    alreadyUsedInRound.append(indexOfSelectedEvent)
    // return the question
    return eventStruct.eventCollection[indexOfSelectedEvent]
    }
    // Run this^ code 4 times? Maybe in viewDidLoad () {
    // for i in 1...4 {displayRandomEvent()}}
    
    // Check final order
    //func isCorrect(//what goes here?)) -> Bool {
    
    // if historicalEveent1.date > historicalEvent2.date etc. 
    
    
    
    
    
    
    
}
