//
//  ComplicationController.swift
//  ComplicatedWatch Extension
//
//  Created by Vasile Cotovanu on 07/07/15.
//  Copyright © 2015 Vasile Cotovanu. All rights reserved.
//

import ClockKit


class ComplicationController: NSObject, CLKComplicationDataSource {
    
    // MARK: - Timeline Configuration
    
    func getSupportedTimeTravelDirectionsForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTimeTravelDirections) -> Void) {
        handler([.Forward, .Backward])
    }
    
    func getTimelineStartDateForComplication(complication: CLKComplication, withHandler handler: (NSDate?) -> Void) {
        let data = Data()
        let itemDate = data.talks.first?.startDate
        handler(itemDate)
    }
    
    func getTimelineEndDateForComplication(complication: CLKComplication, withHandler handler: (NSDate?) -> Void) {
        let data = Data()
        let itemDate = data.talks.last?.startDate
        handler(itemDate)
    }
    
    func getPrivacyBehaviorForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.ShowOnLockScreen)
    }
    
    // MARK: - Timeline Population
    
    func getCurrentTimelineEntryForComplication(complication: CLKComplication, withHandler handler: ((CLKComplicationTimelineEntry?) -> Void)) {
        getTimelineEntriesForComplication(complication, beforeDate: NSDate(), limit: 1) { (entries) -> Void in
            handler(entries?.first)
        }
    }
    
    func getTimelineEntriesForComplication(complication: CLKComplication, beforeDate date: NSDate, limit: Int, withHandler handler: (([CLKComplicationTimelineEntry]?) -> Void)) {
        let data = Data()
        var entries = [CLKComplicationTimelineEntry]()

        for var index = data.talks.count - 1; index >= 0; index-- {
            let itemDate = data.talks[index].startDate
            if date.compare(itemDate) == NSComparisonResult.OrderedDescending {
                let template = CLKComplicationTemplateModularLargeStandardBody()
                template.headerTextProvider = CLKTimeTextProvider(date: itemDate)
                template.body1TextProvider = CLKSimpleTextProvider(text: data.talks[index].title as String)
                template.body2TextProvider = CLKSimpleTextProvider(text: data.talks[index].speaker as String)
                
                let image:UIImage = UIImage(named: data.talks[index].company + ".png")!
                template.headerImageProvider = CLKImageProvider(backgroundImage: image, backgroundColor: nil)
                
                let entry = CLKComplicationTimelineEntry(date: itemDate, complicationTemplate: template)
                entries.append(entry)
                
                if entries.count == limit {
                    break
                }
            }
        }
        
        handler(entries)
    }
    
    func getTimelineEntriesForComplication(complication: CLKComplication, afterDate date: NSDate, limit: Int, withHandler handler: (([CLKComplicationTimelineEntry]?) -> Void)) {
        let data = Data()
        var entries = [CLKComplicationTimelineEntry]()
        
        for var index = 0; index < data.talks.count; index++ {
            let itemDate = data.talks[index].startDate
            if date.compare(itemDate) == NSComparisonResult.OrderedAscending {
                let template = CLKComplicationTemplateModularLargeStandardBody()
                template.headerTextProvider = CLKTimeTextProvider(date: itemDate)
                template.body1TextProvider = CLKSimpleTextProvider(text: data.talks[index].title as String)
                template.body2TextProvider = CLKSimpleTextProvider(text: data.talks[index].speaker as String)
                
                let image:UIImage = UIImage(named: data.talks[index].company + ".png")!
                template.headerImageProvider = CLKImageProvider(backgroundImage: image, backgroundColor: nil)
                
                let entry = CLKComplicationTimelineEntry(date: itemDate, complicationTemplate: template)
                entries.append(entry)
                
                if entries.count == limit {
                    break
                }
            }
        }
        
        handler(entries)
    }
    
    // MARK: - Update Scheduling
    
    func getNextRequestedUpdateDateWithHandler(handler: (NSDate?) -> Void) {
        // Call the handler with the date when you would next like to be given the opportunity to update your complication content
        handler(nil);
    }
    
    // MARK: - Placeholder Templates
    
    func getPlaceholderTemplateForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTemplate?) -> Void) {
        let template = CLKComplicationTemplateModularLargeStandardBody()
        
        template.headerTextProvider = CLKSimpleTextProvider(text: "Hi guy")
        template.body1TextProvider = CLKSimpleTextProvider(text: "HabbaHabba")
        let image:UIImage = UIImage(named: "love.png")!
        template.headerImageProvider = CLKImageProvider(backgroundImage: image, backgroundColor: nil)
        
        handler(template)
    }
    
}
