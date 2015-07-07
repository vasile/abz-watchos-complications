//
//  Data.swift
//  ComplicateAppBuilders
//
//  Created by Vasile Cotovanu on 07/07/15.
//  Copyright © 2015 Vasile Cotovanu. All rights reserved.
//

import Foundation

class Data {
    class Talk {
        let speaker : String
        let company : String
        let title : String
        let subtitle : String
        let duration : Int
        let startDate : NSDate
        
        let nowDate = NSDate()
    
        init(speaker: String, company: String, title: String, subtitle: String, duration: Int) {
            self.speaker = speaker
            self.company = company
            self.title = title
            self.subtitle = subtitle
            self.duration = duration
            
            let timeInterval : NSTimeInterval = Double(duration * 60)
            self.startDate = NSDate(timeInterval: timeInterval, sinceDate: NSDate())
        }
    }
    
    let talks = [
        Talk(speaker: "John", company: "local", title: "Welcome", subtitle: "Quick Intro", duration: -10),
        Talk(speaker: "Vasile", company: "local", title: "What's New In iOS9", subtitle: "Watch Complications", duration: -5),
        Talk(speaker: "Oliver", company: "love", title: "Apps With Love", subtitle: "How do you build", duration: 5),
        Talk(speaker: "Vikram", company: "local", title: "What's New In iOS9", subtitle: "App Indexing", duration: 20),
        Talk(speaker: "Michael", company: "love", title: "Apps With Love", subtitle: "How do you deploy", duration: 30),
        Talk(speaker: "John", company: "local", title: "Ending", subtitle: "Drinks", duration: 45)
    ]   
}