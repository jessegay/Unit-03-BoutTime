//
//  EventCollection.swift
//  Unit-03-BoutTime-JesseGay
//
//  Created by Jesse Gay on 11/9/18.
//  Copyright © 2018 Jesse Gay. All rights reserved.
//

import Foundation

// This acts as a "library" of events that each round will pull from when it populates the buttons. It could be just an array, but on the last project I was advised to use a Struct with a single array as a stored property to allow for future customization.

struct EventStruct {
    var eventCollection: [Event] = [
        Event(eventName: "\"This Is America\" by Childish Gambino", date: 2018),
        Event(eventName: "\"Starboy\" by The Weekend feat. Daft Punk",
            date: 2017),
        Event(eventName: "\"Hello\" by Adele", date: 2016),
        Event(eventName: "\"Can't Feel My Face\" by The Weekend", date: 2015),
        Event(eventName: "\"Happy\" by Pharrell Williams", date: 2014),
        Event(eventName: "\"Royals\" by Lorde", date: 2013),
        Event(eventName: "\"Somebody That I Used To Know\" by Gotye", date: 2012),
        Event(eventName: "\"Rolling In The Deep\" by Adele", date: 2011),
        Event(eventName: "\"Poker Face\" by Lady Gaga", date: 2009)



]
}
    
    
    
    
    

