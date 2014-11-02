//
//  ViewController.swift
//  ServerManagerDemo
//
//  Created by binaryboy on 10/30/14.
//  Copyright (c) 2014 AhmedHamdy. All rights reserved.
//

import UIKit


class ViewController: UIViewController , ServerManagerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //operation
        var operation:NSInvocationOperation=NSInvocationOperation(target:self, selector: "callWebServiceSelector", object: nil);
        println(ApplicationManager.sharedInstance.applicationQueue);

        ApplicationManager.sharedInstance.applicationQueue.addOperation(operation);


    }
    func callWebServiceSelector()
    {
        var serverManager:ServerManager=ServerManager(delegate: self);
        serverManager.callServer();
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func serverConnection(connection:AnyObject, ISFinishSuccessWithData data:AnyObject )
    {
        println(data);

    }
    func serverConnection(connection:AnyObject, ISFailedByReason data:AnyObject )
    {
        
    }
    func serverConnection(connection:AnyObject, ISReturnStatusCode data:AnyObject )
    {
    }


}

