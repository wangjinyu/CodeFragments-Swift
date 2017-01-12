//
//  CFMacrosDefinition.swift
//  CodeFragments-Swift
//
//  Created by jeevan on 2016/12/20.
//  Copyright © 2016年 jeevan. All rights reserved.
//

import Foundation
import UIKit

//MARK: - 屏幕相关

//获取当前设备屏幕宽度
public let screen_width  : CGFloat           =   UIScreen.main.bounds.size.width

//获取当前设备屏幕高度
public let screen_height : CGFloat           =   UIScreen.main.bounds.size.height

//获取当前设备屏幕比例 （eg. 1x, 2x, 3x）
public let screen_scale  : CGFloat           =   UIScreen.main.scale

/// 布局根据宽度自适应
///
/// - Parameter width: 设计稿出的屏幕宽度
/// - Returns: 计算出实际屏幕的宽度和设计稿的宽度比例.
public func layout_width_scale(width : CGFloat) -> CGFloat {
    return width / screen_width
}

/// 布局根据宽度自适应
///
/// - Parameter width: 设计稿出的屏幕宽度
/// - Returns: 计算出实际屏幕的宽度和设计稿的宽度比例.
public func layout_height_scale(height : CGFloat) -> CGFloat {
    return height / screen_height
}

//MARK: - 字体相关

/// 系统 Helvetica 字体 - 根据传入的字体大小返回字体
///
/// - Parameter fontSize: 字体大小
/// - Returns: UIFont 实例.
public func font_helvetica(fontSize:CGFloat) -> UIFont {
    return UIFont.init(name: "Helvetica", size: fontSize)!
}

/// 系统 Helvetica 字体 - 根据传入的字体大小返回字体 (light)
///
/// - Parameter fontSize: 字体大小
/// - Returns: UIFont 实例.
public func font_helvetica_light(fontSize:CGFloat) -> UIFont {
    return UIFont.init(name: "Helvetica-light", size: fontSize)!
}

/// 系统 Helvetica 字体 - 根据传入的字体大小返回字体 (bold)
///
/// - Parameter fontSize: 字体大小
/// - Returns: UIFont 实例.
public func font_helvetica_bold(fontSize:CGFloat) -> UIFont {
    return UIFont.init(name: "Helvetica-bold", size: fontSize)!
}

/// 特殊数字字体
///
/// - Parameter fontSize: 字体大小
/// - Returns: UIFont 实例.
public func font_bebas_neue(fontSize:CGFloat) -> UIFont {
    return UIFont.init(name: "BebasNeue", size: fontSize)!
}

//MARK: - 系统相关

/// 系统版本号 float 类型
///
/// - Returns: float 类型系统版本号。
public func system_version_float() -> CGFloat {
    return CGFloat((UIDevice.current.systemVersion as NSString).floatValue)
}

/// 系统版本号 String 类型
///
/// - Returns: String 类型系统版本号。
public func system_version_string() -> String {
    return UIDevice.current.systemVersion
}

//MARK: - App相关.

/// 获取 App 版本号
///
/// - Returns: 版本号
public func app_version() -> String {
    return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
}

/// 获取 app build 号
///
/// - Returns: build 号
public func app_build_version() -> String {
    return Bundle.main.infoDictionary?["CFBundleVersion"] as! String
}

/// 获取 app bundle id.
///
/// - Returns: bundle identifier.
public func app_bundle_identifier() -> String {
    return Bundle.main.bundleIdentifier!
}

/// 获取 app document 目录
///
/// - Parameter path: 可选参数, 要拼接的二级目录，
/// - Returns: 拼接后的目录
public func system_path_documents(_ path : String = "") -> String {
    var systemPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0];
    systemPath = (systemPath as NSString).appendingPathComponent(path);
    return systemPath;
}

/// 获取 app library 目录
///
/// - Parameter path: 可选参数, 要拼接的二级目录，
/// - Returns: 拼接后的目录
public func system_path_library(_ path : String = "") -> String {
    var systemPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0];
    systemPath = (systemPath as NSString).appendingPathComponent(path);
    return systemPath;
}

/// 获取 app cache 目录
///
/// - Parameter path: 可选参数, 要拼接的二级目录，
/// - Returns: 拼接后的目录
public func system_path_caches(_ path : String = "") -> String {
    var systemPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0];
    systemPath = (systemPath as NSString).appendingPathComponent(path);
    return systemPath;
}
