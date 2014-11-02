//
//  ApplicationManager.swift
//  ServerManagerDemo
//
//  Created by binaryboy on 10/31/14.
//  Copyright (c) 2014 AhmedHamdy. All rights reserved.
//

import Foundation
private let _SingletonASharedInstance = ApplicationManager()

class ApplicationManager  {
    let applicationQueue:NSOperationQueue=NSOperationQueue();
    class var sharedInstance : ApplicationManager {
    return _SingletonASharedInstance
    }
    
    init()
    {
        applicationQueue.maxConcurrentOperationCount=1
        
    }
    
}