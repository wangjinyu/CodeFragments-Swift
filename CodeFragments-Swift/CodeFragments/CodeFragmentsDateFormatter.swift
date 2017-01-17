//
//  CodeFragmentsDateFormatter.swift
//  CodeFragments-Swift
//
//  Created by jinyu on 2017/1/16.
//  Copyright © 2017年 jeevan. All rights reserved.
//

import Foundation

extension Date {
    
    /// 根据给定的时间字符串格式化成 Date 类型的时间
    ///
    /// - Parameter dateString: 时间字符串
    /// - Returns: Date 对象
    public static func date(dateString: String) -> Date? {
        //获取字符串长度
        let length = dateString.characters.count
        
        //初始化 DateFormatter
        let formatter : DateFormatter = DateFormatter()
        formatter.locale = Locale.init(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone.init(secondsFromGMT: 0)
        
        if length == 10 {
            //字符串只有10位
            
            formatter.dateFormat = "YYYY-MM-dd"
            return formatter.date(from: dateString)
        } else if length == 19 {
            //字符串19位
            
            let index = dateString.index(dateString.startIndex, offsetBy: 10)
            if dateString[index] == "T" {
                //8601时间格式
                formatter.dateFormat = "YYYY-MM-dd'T'HH:mm:ss"
                return formatter.date(from: dateString)
            } else {
                //普通时间格式
                formatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
                return formatter.date(from: dateString)
            }
        } else if length == 20 {
            let index = dateString.index(dateString.startIndex, offsetBy: 10)
            if dateString[index] == "T" {
                formatter.dateFormat = "YYYY-MM-dd'T'HH:mm:ssZ"
                return formatter.date(from: dateString)
            } else {
                formatter.dateFormat = "YYYY-MM-dd HH:mm:ssZ"
                return formatter.date(from: dateString)
            }
        } else if length == 23 {
            let index = dateString.index(dateString.startIndex, offsetBy: 10)
            if dateString[index] == "T" {
                formatter.dateFormat = "YYYY-MM-dd'T'HH:mm:ss.SSS"
                return formatter.date(from: dateString)
            } else {
                formatter.dateFormat = "YYYY-MM-dd HH:mm:ss.SSS"
                return formatter.date(from: dateString)
            }
        } else if length == 24 {
            let index = dateString.index(dateString.startIndex, offsetBy: 10)
            if dateString[index] == "T" {
                formatter.dateFormat = "YYYY-MM-dd'T'HH:mm:ss.SSSZ"
                return formatter.date(from: dateString)
            } else {
                formatter.dateFormat = "YYYY-MM-dd HH:mm:ss.SSSZ"
                return formatter.date(from: dateString)
            }
        } else if length == 27 {
            let index = dateString.index(dateString.startIndex, offsetBy: 10)
            if dateString[index] == "T" {
                formatter.dateFormat = "YYYY-MM-dd'T'HH:mm:ss.SSSSSSZ"
                return formatter.date(from: dateString)
            } else {
                formatter.dateFormat = "YYYY-MM-dd HH:mm:ss.SSSSSSZ"
                return formatter.date(from: dateString)
            }
        } else if length == 28 || length == 29 {
            formatter.dateFormat = "YYYY-MM-dd'T'HH:mm:ss.SSSZ"
            return formatter.date(from: dateString)
        } else if length == 30 {
            formatter.dateFormat = "EEE MMM dd HH:mm:ss Z yyyy"
            return formatter.date(from: dateString)
        } else if length == 34 {
            formatter.dateFormat = "EEE MMM dd HH:mm:ss.SSS Z yyyy"
            return formatter.date(from: dateString)
        }
        return Date()
    }
    
    
    /// 根据指定的格式返回时间的字符串代码
    ///
    /// - Parameter format: 格式
    /// - Returns: 格式化时间字符串
    public func string(format: String) -> String {
        let formatter : DateFormatter = DateFormatter()
        formatter.calendar = Calendar.init(identifier: Calendar.Identifier.gregorian)
        formatter.locale = Locale.init(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone.init(secondsFromGMT: 0)
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
