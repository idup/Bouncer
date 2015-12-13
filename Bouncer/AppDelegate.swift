//
//  AppDelegate.swift
//  Bouncer
//
//  Created by CS193p Instructor.
//  Copyright (c) 2015 Stanford University. All rights reserved.
//

import UIKit
import CoreMotion

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?
    
    // APP中所有用CoreMotion的对象都需要使用AppDelegate中的Manager
    struct Motion {
        static let Manager = CMMotionManager()
    }
}
