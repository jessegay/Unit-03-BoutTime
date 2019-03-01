//
//  Array+IsSorted.swift
//  Unit-03-BoutTime-JesseGay
//
//  Created by Jesse Gay on 12/11/18.
//  Copyright © 2018 Jesse Gay. All rights reserved.
//

import Foundation

// Checks if an array is sorted. From https://stackoverflow.com/questions/24602595/extending-array-to-check-if-it-is-sorted-in-swift

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
