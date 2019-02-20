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
        Event(eventName: "\"God's Plan\" by Drake", date: 2018, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2018", id: 0),
        Event(eventName: "\"Shape of You\" by Ed Sheeran",
              date: 2017, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2017", id: 1),
        Event(eventName: "\"Love Yourself\" by Justin Bieber", date: 2016, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2016", id: 2),
        Event(eventName: "\"Uptown Funk\" by Mark Ronson feat. Bruno Mars", date: 2015, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2015", id: 3),
        Event(eventName: "\"Happy\" by Pharrell Williams", date: 2014, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2014", id: 4),
        Event(eventName: "\"Thrift Shop\" by Macklemore & Ryan Lewis featuring Wanz", date: 2013, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2013", id: 5),
        Event(eventName: "\"Somebody That I Used To Know\" by Gotye feat. Kimbra", date: 2012, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2012", id: 6),
        Event(eventName: "\"Rolling In The Deep\" by Adele", date: 2011, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2011", id: 7),
        Event(eventName: "\"Irreplaceable\" by Beyoncé", date: 2009, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2007", id: 8)



        ]

}
    
    
    
    
    

