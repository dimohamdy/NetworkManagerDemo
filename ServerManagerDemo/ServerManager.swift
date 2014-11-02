//
//  ServerManager.swift
//  ServerManagerDemo
//
//  Created by binaryboy on 10/30/14.
//  Copyright (c) 2014 AhmedHamdy. All rights reserved.
//

import Foundation



protocol ServerManagerDelegate {
    func serverConnection(connection:AnyObject, ISFinishSuccessWithData data:AnyObject )
    func serverConnection(connection:AnyObject, ISFailedByReason data:AnyObject )
    func serverConnection(connection:AnyObject, ISReturnStatusCode data:AnyObject )

}


class ServerManager: NSObject {
    var data: NSMutableData
    var urlPath: String
    var url: NSURL
    var request: NSURLRequest
    var connection: NSURLConnection
    var delegate:ServerManagerDelegate?
    
    

    init(delegate : ServerManagerDelegate)
    {
       self.delegate = delegate
        data = NSMutableData()  // Declare Globally
        urlPath="";
        url=NSURL();
        request = NSURLRequest()
        connection = NSURLConnection();
    }
    func callServer()
    {
         urlPath              = "http://gdata.youtube.com/feeds/api/standardfeeds/most_popular?v=2&alt=json"
         url                  = NSURL(string: urlPath)
         request              = NSURLRequest(URL: url)
         connection           = NSURLConnection(request: request, delegate: self, startImmediately: false)
         println(ApplicationManager.sharedInstance.applicationQueue);
         println(NSOperationQueue.currentQueue());

        //connection.setDelegateQueue(ApplicationManager.sharedInstance.applicationQueue);
        connection.setDelegateQueue(NSOperationQueue.currentQueue())
         connection.start()
        
        
    }
    func scheduleInRunLoop(aRunLoop: NSRunLoop,
        forMode mode: String)
    {
        
    }
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        println(NSOperationQueue.currentQueue());

        self.data.appendData(data)
    }
    
    
    func connectionDidFinishLoading(connection: NSURLConnection!)
    {
        println(NSOperationQueue.currentQueue());

        var err: NSError
        // throwing an error on the line below (can't figure out where the error message is)
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
       // println(jsonResult)
        
        delegate?.serverConnection(self, ISFinishSuccessWithData: jsonResult);
    
    
    }
    func connection(connection: NSURLConnection, didFailWithError error: NSError)
    {
        println(NSOperationQueue.currentQueue());

        delegate?.serverConnection(self, ISFailedByReason: data);

    }
}