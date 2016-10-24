//
//  ViewController.swift
//  POSTTest
//
//  Created by ComarPers 922 on 2016/10/22.
//  Copyright © 2016年 ComarPers 922. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var info: UILabel!
    
    @IBOutlet weak var num1: UITextField!
    
    @IBOutlet weak var num2: UITextField!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func PostIt(_ sender: AnyObject)
    {
        let request = NSMutableURLRequest(url: NSURL(string: "http://127.0.0.1:4700")! as URL)
        request.httpMethod = "POST"
        request.httpBody = "num1=\(num1.text!)&num2=\(num2.text!)".data(using: String.Encoding.utf8)
        let task = URLSession.shared.dataTask(with: request as URLRequest)
        {
            (data, response, error) in
            if let _ = error
            {
                DispatchQueue.main.async
                {
                        self.info.text = "\(error)"
                }
            }
            else
            {
                DispatchQueue.main.async
                {
                    self.info.text = String(data: data!, encoding: String.Encoding.utf8)
                }
            }
        }
        task.resume()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

