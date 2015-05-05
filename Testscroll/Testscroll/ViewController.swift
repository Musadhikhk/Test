//
//  ViewController.swift
//  Testscroll
//
//  Created by Musadhikh Muhammed K on 05/05/15.
//  Copyright (c) 2015 InApp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var post: UIButton!

    @IBAction func postData(sender: AnyObject) {
        
        let image = UIImage(named: "AdImage")
        var imageData = UIImagePNGRepresentation(image)
        let base64String = imageData.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
        
        let url =  NSURL(string: "http://www.vcareapp.in/OLX_app/index.php/api/ad_post")
        
        let params : Dictionary<String , String > = ["user_name":"testmail123@gmail.com","password":"password123","title":"Test ad 1","description":"This is a test ad 1","scheduled_from":"2015-05-10 10:15:10","scheduled_to":"2015-05-20 10:15:10","ad_image":"dsfdsfdsf","date":"2015-05-5 10:15:10"]
        
        var request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "POST"
        
        
        // testilkj
        
        var err : NSError?
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: &err)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        var session = NSURLSession.sharedSession()
        
        var data = NSData()
        var response = NSURLResponse()
        var error = NSError()
        
        session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            
            let json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as? NSDictionary
            println(json)
            
        }).resume()
        
    }
}

