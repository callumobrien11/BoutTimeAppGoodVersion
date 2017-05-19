//
//  events .swift
//  BoutTime App
//
//  Created by Callum O'Brien on 2017-04-14.
//  Copyright © 2017 Callum. All rights reserved.
//

import Foundation
import UIKit
import GameKit




struct Events {
    let events: [[String: Any]]

        
        
    
    func displayEvents(label1: UILabel, label2: UILabel, label3: UILabel,label4: UILabel) {
        
        var index1 = GKRandomSource.sharedRandom().nextInt(upperBound: events.count)
        var index2 = GKRandomSource.sharedRandom().nextInt(upperBound: events.count)
        var index3 = GKRandomSource.sharedRandom().nextInt(upperBound: events.count)
        var index4 = GKRandomSource.sharedRandom().nextInt(upperBound: events.count)
        
        while index1 == index2 || index1 == index3 || index1 == index4 || index2 == index3 || index2 == index4 || index3 == index4 {
            index1 = GKRandomSource.sharedRandom().nextInt(upperBound: events.count)
            index2 = GKRandomSource.sharedRandom().nextInt(upperBound: events.count)
            index3 = GKRandomSource.sharedRandom().nextInt(upperBound: events.count)
            index4 = GKRandomSource.sharedRandom().nextInt(upperBound: events.count)
            
        }
        
        if let event1 = events[index1]["event"] as? String,  let event2 = events[index2]["event"] as? String, let event3 = events[index3]["event"] as? String, let event4 = events[index4]["event"] as? String, let date1 = events[index1]["date"] as? Int, let date2 = events[index2]["date"] as? Int, let date3 = events[index3]["date"] as? Int, let date4 = events[index4]["date"] as? Int {
            label1.text = event1
            label1.tag = date1
            label2.text = event2
            label2.tag = date2
            label3.text = event3
            label3.tag = date3
            label4.text = event4
            label4.tag = date4
            
            label1.isHidden = false
            label2.isHidden = false
            label3.isHidden = false
            label4.isHidden = false
            
                    
            
        } else {
            fatalError()
        }
    
    
    }
    
}









let events = Events(events:  [
    ["event":"Martin Luther King Jr speech", "date": 1963],
    ["event":"The iceberg believed to have sunk the Titanic", "date": 1912],
    ["event":"Neil Armstrong walked on the moon","date":1969],
    ["event":"Nelson Mandela Was Released", "date":1990],
    ["event":"Bill Clinton Becomes US President","date":1993],
    ["event":"Spacecraft Pathfinder Lands On Mars","date":1997],
    ["event":"September 11th World Trade Centre Attack","date":2001],
    ["event":"Burj Khalifa Became The Worlds Tallest Building","date": 2007],
    ["event":"Steve Jobs Passed Away","date": 2011],
    ["event":"Facebook Bought WhatsApp", "date" :2014],
    ["event":"The KKK Marches in Washington","date":1925],
    ["event":"First Computer Made","date":1946],
    ["event":"first gun invented", "date":1892],
    ["event":"Woman got the right to vote","date":1920],
    ["event":"End of World War Two","date":1945],
    ["event":"First creit card","date": 1850],
    ["event":"First car built in America","date":1893],
    ["event":"the first spaceship to carry a human into space","date": 1961],
    ["event":"The first Smartphone","date":1994],
    ["event":"First plane to fly","date":1903],
    ["event":"Facebook was created","date": 2004],
    ["event":"Internet was created","date":1980],
    ["event":"IPod was created","date": 2001],
    ["event":"Canada was born","date":1867],
    ["event":"Muhammad ali passed away","date":2016]
])
























