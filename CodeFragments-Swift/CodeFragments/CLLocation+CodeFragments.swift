//
//  CLLocation+CodeFragments.swift
//  CodeFragments-Swift
//
//  Created by jinyu on 2017/1/13.
//  Copyright © 2017年 jeevan. All rights reserved.
//

import Foundation
import CoreLocation

//MARK: - CLLocation extension : CLLocation对象坐标系转换

extension CLLocation {

//MARK: - 地球坐标和火星坐标的 CLLocation 对象互转
    
    /// 地球坐标转火星坐标
    ///
    /// - Parameter fromEarth: 火星坐标
    /// - Returns: 火星坐标的CLLocation
    public class func locationMars(fromEarth:CLLocation) -> CLLocation {
        let coordinateMars = transform_earth_2_mars(latitudeEarth: fromEarth.coordinate.latitude, longitudeEarth: fromEarth.coordinate.longitude)
        return CLLocation.init(coordinate: CLLocationCoordinate2DMake(coordinateMars.latitudeMars, coordinateMars.longitudeMars), altitude: fromEarth.altitude, horizontalAccuracy: fromEarth.horizontalAccuracy, verticalAccuracy: fromEarth.verticalAccuracy, course: fromEarth.course, speed: fromEarth.speed, timestamp: fromEarth.timestamp)
    }
    
    /// 火星坐标转地球坐标
    ///
    /// - Parameter fromMars: 火星坐标
    /// - Returns: 地球坐标的CLLocation
    public class func locationEarth(fromMars:CLLocation) -> CLLocation {
        let coordinateEarth = transform_earth_from_mars(latitudeMars: fromMars.coordinate.latitude, longitudeMars: fromMars.coordinate.longitude)
        return CLLocation.init(coordinate: CLLocationCoordinate2DMake(coordinateEarth.latitudeEarth, coordinateEarth.longitudeEarth), altitude: fromMars.altitude, horizontalAccuracy: fromMars.horizontalAccuracy, verticalAccuracy: fromMars.verticalAccuracy, course: fromMars.course, speed: fromMars.speed, timestamp: fromMars.timestamp)
    }

//MARK: - 百度坐标和火星坐标的 CLLocation 对象互转
    
    /// 火星坐标转百度坐标
    ///
    /// - Parameter fromMars: 火星坐标
    /// - Returns: 百度坐标的CLLocation
    public class func locationBaidu(fromMars:CLLocation) -> CLLocation {
        let coordinateBardu = transform_mars_2_bear_paw(latitudeMars: fromMars.coordinate.latitude, longitudeMars: fromMars.coordinate.longitude)
        return CLLocation.init(coordinate: CLLocationCoordinate2DMake(coordinateBardu.latitudeBaidu, coordinateBardu.longitudeBaidu), altitude: fromMars.altitude, horizontalAccuracy: fromMars.horizontalAccuracy, verticalAccuracy: fromMars.verticalAccuracy, course: fromMars.course, speed: fromMars.speed, timestamp: fromMars.timestamp)
    }
    
    /// 百度坐标转火星坐标
    ///
    /// - Parameter fromBaidu: 百度坐标
    /// - Returns: 火星坐标的CLLocation.
    public class func locationMars(fromBaidu:CLLocation) -> CLLocation {
        let coordinateMars = transform_bear_paw_2_mars(latitudeBaidu: fromBaidu.coordinate.latitude, longitudeBaidu: fromBaidu.coordinate.longitude)
        return CLLocation.init(coordinate: CLLocationCoordinate2DMake(coordinateMars.latitudeMars, coordinateMars.longitudeMars), altitude: fromBaidu.altitude, horizontalAccuracy: fromBaidu.horizontalAccuracy, verticalAccuracy: fromBaidu.verticalAccuracy, course: fromBaidu.course, speed: fromBaidu.speed, timestamp: fromBaidu.timestamp)
    }

//MARK: - 地球坐标和百度坐标的 CLLocation 对象互转
    
    /// 地球坐标转百度坐标
    ///
    /// - Parameter fromEarth: 地球坐标
    /// - Returns: 百度坐标
    public class func locationBaidu(fromEarth:CLLocation) -> CLLocation {
        let locationMars = CLLocation.locationMars(fromEarth: fromEarth);
        return CLLocation.locationBaidu(fromMars: locationMars);
    }
    
    /// 百度坐标转地球坐标
    ///
    /// - Parameter fromBaidu: 百度坐标
    /// - Returns: 地球坐标
    public class func locationEarth(fromBaidu:CLLocation) -> CLLocation {
        let locationMars = CLLocation.locationMars(fromBaidu: fromBaidu)
        return CLLocation.locationEarth(fromMars: locationMars)
    }
}

//MARK: - CLLocationCoordinate2D extension : CLLocationCoordinate2D 坐标系转换

extension CLLocationCoordinate2D {
    
//MARK: - 地球和火星的 CLLocationCoordinate2D 坐标系互转
    
    /// 地球坐标系转火星坐标系
    ///
    /// - Parameter fromEarth: 地球坐标系
    /// - Returns: 火星坐标系的 CLLocationCoordinate2D 坐标.
    public static func coordinateMars(fromEarth: CLLocationCoordinate2D) -> CLLocationCoordinate2D {
        let coordinateMars = transform_earth_2_mars(latitudeEarth: fromEarth.latitude, longitudeEarth: fromEarth.longitude)
        return CLLocationCoordinate2DMake(coordinateMars.latitudeMars, coordinateMars.longitudeMars)
    }
    
    
    /// 火星坐标系转地球坐标系
    ///
    /// - Parameter fromMars: 火星坐标系
    /// - Returns: 地球坐标系的 CLLocationCoordinate2D 坐标.
    public static func coordinateEarth(fromMars: CLLocationCoordinate2D) -> CLLocationCoordinate2D {
        let coordinateEarth = transform_earth_from_mars(latitudeMars: fromMars.latitude, longitudeMars: fromMars.longitude)
        return CLLocationCoordinate2DMake(coordinateEarth.latitudeEarth, coordinateEarth.longitudeEarth)
    }
    
//MARK: - 百度和火星的 CLLocationCoordinate2D 坐标系互转
    
    /// 百度坐标系转火星坐标系
    ///
    /// - Parameter fromBaidu: 百度坐标
    /// - Returns: 火星坐标系的 CLLocationCoordinate2D 坐标
    public static func coordinateMars(fromBaidu: CLLocationCoordinate2D) -> CLLocationCoordinate2D {
        let coordinateMars = transform_bear_paw_2_mars(latitudeBaidu: fromBaidu.latitude, longitudeBaidu: fromBaidu.longitude)
        return CLLocationCoordinate2DMake(coordinateMars.latitudeMars, coordinateMars.longitudeMars)
    }
    
    /// 火星坐标系转百度坐标系
    ///
    /// - Parameter fromMars: 火星坐标
    /// - Returns: 百度坐标系的 CLLocationCoordinate2D 坐标
    public static func coordinateBaidu(fromMars: CLLocationCoordinate2D) -> CLLocationCoordinate2D {
        let coordinateBaidu = transform_mars_2_bear_paw(latitudeMars: fromMars.latitude, longitudeMars: fromMars.longitude)
        return CLLocationCoordinate2DMake(coordinateBaidu.latitudeBaidu, coordinateBaidu.longitudeBaidu)
    }
    
//MARK: - 百度和地球的 CLLocationCoordinate2D 坐标系互转
    
    /// 百度坐标系转地球坐标系
    ///
    /// - Parameter fromBaidu: 百度坐标
    /// - Returns: 地球坐标系的 CLLocationCoordinate2D 坐标
    public static func coordinateEarth(fromBaidu: CLLocationCoordinate2D) -> CLLocationCoordinate2D {
        let locationBaidu = CLLocation.init(latitude: fromBaidu.latitude, longitude: fromBaidu.longitude)
        let locationEarth = CLLocation.locationEarth(fromBaidu: locationBaidu)
        return locationEarth.coordinate
    }
    
    /// 地球坐标系转百度坐标系
    ///
    /// - Parameter fromEarth: 地球坐标
    /// - Returns: 百度坐标的 CLLocationCoordinate2D 坐标
    public static func coordinateBaidu(fromEarth: CLLocationCoordinate2D) -> CLLocationCoordinate2D {
        let locationEarth = CLLocation.init(latitude: fromEarth.latitude, longitude: fromEarth.longitude)
        let locationBaidu = CLLocation.locationBaidu(fromEarth: locationEarth)
        return locationBaidu.coordinate
    }
}


// a  = 6378245.0, 1/f = 298.3
// b  = b = a * (1 - f)
// ee =  (a^2 - b^2) / a^2

private let a  = 6378245.0
private let ee = 0.00669342162296594323

//MARK: - 私有方法

/// 判断一个坐标是否在中国境内
///
/// - Parameters:
///   - latitude: 纬度
///   - longitude: 经度
/// - Returns: 是否在国内
fileprivate func transform_sino_out_china(latitude:CLLocationDegrees, longitude:CLLocationDegrees) -> Bool {
    if longitude < 72.004 || longitude > 137.8347 {
        return true
    }
    if latitude < 0.8239 || latitude > 55.8271 {
        return true
    }
    return false
}

//MARK: - 地球坐标转火星坐标

fileprivate func transform_earth_2_mars_latitude(x : Double, y : Double) -> Double {
    var ret : Double = -100.0 + 2.0 * x + 3.0 * y + 0.2 * y * y + 0.1 * x * y + 0.2 * sqrt(fabs(x))
    
    ret += (20.0 * sin(6.0 * x * Double.pi) + 20.0 * sin(2.0 * x * Double.pi)) * 2.0 / 3.0
    ret += (20.0 * sin(y * Double.pi) + 40.0 * sin(y / 3.0 * Double.pi)) * 2.0 / 3.0
    ret += (160.0 * sin(y / 12.0 * Double.pi) + 320 * sin(y * Double.pi / 30.0)) * 2.0 / 3.0
    
    return ret
}

fileprivate func transform_earth_2_mars_lonitude(x : Double, y : Double) -> Double {
    var ret : Double = 300.0 + x + 2.0 * y + 0.1 * x * x + 0.1 * x * y + 0.1 * sqrt(fabs(x))
    
    ret += (20.0 * sin(6.0 * x * Double.pi) + 20.0 * sin(2.0 * x * Double.pi)) * 2.0 / 3.0
    ret += (20.0 * sin(x * Double.pi) + 40.0 * sin(x / 3.0 * Double.pi)) * 2.0 / 3.0
    ret += (150.0 * sin(x / 12.0 * Double.pi) + 300.0 * sin(x / 30.0 * Double.pi)) * 2.0 / 3.0
    
    return ret
}


/// 地球坐标转火星坐标
///
/// - Parameters:
///   - latitudeEarth: 地球坐标纬度
///   - longitudeEarth: 地球坐标经度
/// - Returns: 火星坐标经纬度
fileprivate func transform_earth_2_mars(latitudeEarth:CLLocationDegrees, longitudeEarth:CLLocationDegrees) -> (latitudeMars: CLLocationDegrees, longitudeMars: CLLocationDegrees) {
    if transform_sino_out_china(latitude: latitudeEarth, longitude: longitudeEarth) {
        return (latitudeMars: latitudeEarth, longitudeMars: longitudeEarth)
    }
    
    var deltalatitude : CLLocationDegrees = transform_earth_2_mars_latitude(x: longitudeEarth - 105.0, y: latitudeEarth - 35.0)
    var deltaLongitude: CLLocationDegrees = transform_earth_2_mars_lonitude(x: longitudeEarth - 105.0, y: latitudeEarth - 35.0)
    
    let radlatitude = latitudeEarth / 180.0 * Double.pi
    var magic = sin(radlatitude)
    magic = 1 - ee * magic * magic
    
    let sqrtMagic = sqrt(magic)
    
    deltalatitude = (deltalatitude * 180.0) / ((a * (1 - ee)) / (magic * sqrtMagic) * Double.pi)
    deltaLongitude = (deltaLongitude * 180.0) / (a / sqrtMagic * cos(radlatitude) * Double.pi)
    
    return (latitudeMars: latitudeEarth + deltalatitude, longitudeMars: longitudeEarth + deltaLongitude)
}

//MARK: - 火星坐标和百度坐标互相转换

/// 火星坐标转百度坐标
///
/// - Parameters:
///   - latitudeMars: 火星坐标纬度
///   - longitudeMars: 火星坐标经度
/// - Returns: 百度坐标经纬度
fileprivate func transform_mars_2_bear_paw(latitudeMars: CLLocationDegrees, longitudeMars: CLLocationDegrees) -> (latitudeBaidu: CLLocationDegrees, longitudeBaidu: CLLocationDegrees) {
    let x_pi = Double.pi * 3000.0 / 180.0
    
    let x = longitudeMars
    let y = latitudeMars
    let z = sqrt(x * x + y * y) + 0.00002 * sin(y + x_pi)
    
    let theta = atan2(y, x) + 0.000003 * cos(x * x_pi)
    
    return (latitudeBaidu: z * sin(theta) + 0.006, longitudeBaidu: z * cos(theta) + 0.0065)
}


/// 百度坐标转火星坐标
///
/// - Parameters:
///   - latitudeBaidu: 百度坐标纬度
///   - longitudeBaidu: 百度坐标经度
/// - Returns: 火星坐标经纬度
fileprivate func transform_bear_paw_2_mars(latitudeBaidu:CLLocationDegrees, longitudeBaidu: CLLocationDegrees) -> (latitudeMars: CLLocationDegrees, longitudeMars: CLLocationDegrees) {
    let x_pi = Double.pi * 3000.0 / 180.0
    
    let x = longitudeBaidu - 0.0065
    let y = latitudeBaidu - 0.006
    let z = sqrt(x * x + y * y) - 0.00002 * sin(y * x_pi)
    
    let theta = atan2(y, x) - 0.000003 * cos(x * x_pi);
    
    return (latitudeMars: z * sin(theta), longitudeMars: z * cos(theta))
}

//MARK: - 火星坐标转地球坐标

fileprivate func transform_earth_from_mars_latitude(x: Double, y: Double) -> Double {
    var ret = -100.0 + 2.0 * x + 3.0 * y + 0.2 * y * y + 0.1 * x * y + 0.2 * sqrt(fabs(x))
    
    ret += (20.0 * sin(6.0 * x * Double.pi) + 20.0 * sin(2.0 * x * Double.pi)) * 2.0 / 3.0
    ret += (20.0 * sin(y * Double.pi) + 40.0 * sin(y / 3.0 * Double.pi)) * 2.0 / 3.0
    ret += (160.0 * sin(y / 12.0 * Double.pi) + 320 * sin(y * Double.pi / 30.0)) * 2.0 / 3.0
    
    return ret
}

fileprivate func transform_earth_form_mars_longitude(x: Double, y: Double) -> Double {
    var ret = 300.0 + x + 2.0 * y + 0.1 * x * x + 0.1 * x * y + 0.1 * sqrt(fabs(x))
    
    ret += (20.0 * sin(6.0 * x * Double.pi) + 20.0 * sin(2.0 * x * Double.pi)) * 2.0 / 3.0
    ret += (20.0 * sin(x * Double.pi) + 40.0 * sin(x / 3.0 * Double.pi)) * 2.0 / 3.0
    ret += (150.0 * sin(x / 12.0 * Double.pi) + 300.0 * sin(x / 30.0 * Double.pi)) * 2.0 / 3.0
    
    return ret
}

fileprivate func transform_earth_from_mars(latitudeMars: CLLocationDegrees, longitudeMars:CLLocationDegrees) -> (latitudeEarth: CLLocationDegrees, longitudeEarth: CLLocationDegrees) {
    if transform_sino_out_china(latitude: latitudeMars, longitude: longitudeMars) {
        return (latitudeEarth: latitudeMars, longitudeEarth: longitudeMars)
    }
    
    var dLat = transform_earth_from_mars_latitude(x: longitudeMars - 105.0, y: latitudeMars - 35.0);
    var dLon = transform_earth_form_mars_longitude(x: longitudeMars - 105.0, y: latitudeMars - 35.0);
    let radLat = latitudeMars / 180.0 * Double.pi;
    var magic = sin(radLat);
    magic = 1 - ee * magic * magic;
    let sqrtMagic = sqrt(magic);
    
    dLat = (dLat * 180.0) / ((a * (1 - ee)) / (magic * sqrtMagic) * Double.pi);
    dLon = (dLon * 180.0) / (a / sqrtMagic * cos(radLat) * Double.pi);
    
    return (latitudeEarth: dLat, longitudeEarth: dLon)
}
