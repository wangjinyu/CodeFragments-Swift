//
//  ViewController.swift
//  CodeFragments-Swift
//
//  Created by jeevan on 2016/12/19.
//  Copyright © 2016年 jeevan. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let string = "2017-01-16T05:34:59.000Z"
        let date =  Date.date(dateString: string)
        print("date = \(date)")
        
        print("string = \(date?.string(format: "YYYY-MM-dd"))")
    }
}

