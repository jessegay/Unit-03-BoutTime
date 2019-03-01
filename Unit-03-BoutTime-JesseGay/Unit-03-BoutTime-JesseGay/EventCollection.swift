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
    let eventCollection: [Event] = [
        Event(eventName: "\"God's Plan\" by Drake", date: 2018, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2018", id: 0),
        Event(eventName: "\"Shape of You\" by Ed Sheeran",
              date: 2017, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2017", id: 1),
        Event(eventName: "\"Love Yourself\" by Justin Bieber", date: 2016, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2016", id: 2),
        Event(eventName: "\"Uptown Funk\" by Mark Ronson feat. Bruno Mars", date: 2015, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2015", id: 3),
        Event(eventName: "\"Happy\" by Pharrell Williams", date: 2014, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2014", id: 4),
        Event(eventName: "\"Thrift Shop\" by Macklemore & Ryan Lewis featuring Wanz", date: 2013, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2013", id: 5),
        Event(eventName: "\"Somebody That I Used To Know\" by Gotye feat. Kimbra", date: 2012, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2012", id: 6),
        Event(eventName: "\"Rolling In The Deep\" by Adele", date: 2011, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2011", id: 7),
        Event(eventName: "\"Irreplaceable\" by Beyoncé", date: 2007, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2007", id: 8),
        Event(eventName: "\"We Belong Together\" by Mariah Carey", date: 2005, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2005", id: 9),
        Event(eventName: "\"In Da Club\" by 50 Cent", date: 2003, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2003", id: 10),
        Event(eventName: "\"Hanging by a Moment\" by Lighthouse", date: 2001, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2001", id: 11),
        Event(eventName: "\"Believe\" by Cher", date: 1999, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_1999", id: 12),
        Event(eventName: "\"Macarena (Bayside Boys Mix)\" by Los del Río", date: 1996, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_1996", id: 13),
        Event(eventName: "\"Gangsta's Paradise\" by Coolio feat. L.V.", date: 1995, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_1995", id: 14),
        Event(eventName: "\"The Sign\" by Ace of Base", date: 1994, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_1994", id: 15),
        Event(eventName: "\"End of the Road\" by Boyz II Men", date: 1992, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_1992", id: 16),
        Event(eventName: "\"Hold On\" by Wilson Phillips", date: 1990, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_1990", id: 17),
        Event(eventName: "\"Faith\" by George Michael", date: 1988, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_1988", id: 18),
        Event(eventName: "\"Careless Whisper\"", date: 1985, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_1985", id: 19),
        Event(eventName: "\"When Doves Cry\" by Prince", date: 1984, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_1984", id: 20),
        Event(eventName: "\"Bette Davis Eyes\" by Kim Carnes", date: 1981, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_1981", id: 21),
        Event(eventName: "\"Call Me\" by Blondie", date: 1980, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_1980", id: 22),
        Event(eventName: "\"My Sharona\" by The Knack", date: 1979, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_1979", id: 23),
        Event(eventName: "\"The Way We Were\" by Barbara Streisand", date: 1974, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_1974", id: 24),
        Event(eventName: "\"Bridge Over Troubled Water\" by Simon and Garfunkel", date: 1970, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_1970", id: 25),
        Event(eventName: "\"Hey Jude\"", date: 1968, url: "https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_1968", id: 26)
        ]
}
    
    
    
    
    

