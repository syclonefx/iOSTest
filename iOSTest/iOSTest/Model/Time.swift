//
//  Time.swift
//  iOSTest
//
//  Created by Chuck Perdue on 7/13/18.
//  Copyright © 2018 SycloneFX LLC. All rights reserved.
//

import Foundation

class Time {
    
    // http://nsdateformatter.com
    func epochTime(date: Date) -> Int {
        // https://www.epochconverter.com
        return Int(date.timeIntervalSince1970)
    }
    
    static func gmt() -> Date {
        let now = Date()
        var offset = gmtTimeZoneOffset()
        
        if offset < 0{
            offset = offset * -1
        }
        
        return now.add(hours: offset)
    }
    
    func gmt(timeZone: String) -> Date {
        let now = Date()
        var offset = gmtTimeZoneOffset(timeZone: timeZone)
        
        if offset < 0{
            offset = offset * -1
        }
        
        return now.add(hours: offset)
    }
    
    func nowString() -> String {
        return formatDate(format: "MMM dd, YYYY h:mm a", date: Date())
    }
    
    func nowString(format: String) -> String {
        return formatDate(format: format, date: Date())
    }
    
    func formatDate(format: String, date: Date) -> String {
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
    
    static func gmtTimeZoneOffset() -> Int {
        return NSTimeZone.system.secondsFromGMT(for: Date()) / 3600
    }
    
    func gmtTimeZoneOffset(timeZone: String) -> Int {
        return ((NSTimeZone(name: timeZone)?.secondsFromGMT)! / 3600)
    }
    
    func localTimeZoneIdentifier() -> String {
        return TimeZone.current.identifier
    }
    
    func localTimeZoneName() -> String {
        return Calendar.current.timeZone.localizedName(for: .standard, locale: Locale.current)!
    }
    
    func localTimeZoneAbbreviation() -> String {
        return Calendar.current.timeZone.abbreviation()!
    }
    
    func timeZoneAbbreviations() -> [String:String] {
        return TimeZone.abbreviationDictionary
    }
    
    func timeZoneIdentifier() -> [String] {
        return TimeZone.knownTimeZoneIdentifiers
    }
    
    func isDaylightSavingTime(date: Date) -> Bool {
        return TimeZone.current.isDaylightSavingTime(for: date)
    }
    
    func daylightSavingTimeOffset() -> TimeInterval {
        return TimeZone.current.daylightSavingTimeOffset()
    }
    
    func nextDaylightSavingTimeTransition() -> Date? {
        return TimeZone.current.nextDaylightSavingTimeTransition
    }
}

extension Date {
    func add(hours: Int) -> Date {
        return Calendar(identifier: .gregorian).date(byAdding: .hour, value: hours, to: self)!
    }
}
