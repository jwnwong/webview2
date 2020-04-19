//
//  ViewController.swift
//  webview2
//
//  Created by Papa on 14/4/2020.
//  Copyright © 2020 Papa. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    let webcamControlUrlString = "http://172.20.97.149:5000"
    let webcamViewUrlString = "http://172.20.97.149:8081"
    
    @IBOutlet weak var webView: WKWebView!
    @IBAction func turnUp(_ sender: UIButton? = nil) {
        let url = URL(string: webcamControlUrlString+"/move?movedir=up")
        URLSession.shared.dataTask(with: url!) {(data,response,error) in
            print(String(data: data!, encoding: .utf8) ?? "No return data")
        }.resume()
    }
    
    @IBAction func turnLeft(_ sender: UIButton? = nil) {
        let url = URL(string: webcamControlUrlString+"/move?movedir=left")
        URLSession.shared.dataTask(with: url!) {(data,response,error) in
            print(String(data: data!, encoding: .utf8) ?? "No return data")
        }.resume()
    }
    
    @IBAction func center(_ sender: UIButton) {
        let url = URL(string: webcamControlUrlString+"/move?movedir=center")
        URLSession.shared.dataTask(with: url!) {(data,response,error) in
            print(String(data: data!, encoding: .utf8) ?? "No return data")
        }.resume()
    }
    
    @IBAction func turnRight(_ sender: UIButton? = nil) {
        let url = URL(string: webcamControlUrlString+"/move?movedir=right")
        URLSession.shared.dataTask(with: url!) {(data,response,error) in
            print(String(data: data!, encoding: .utf8) ?? "No return data")
        }.resume()
    }
    
    @IBAction func turnDown(_ sender: Any? = nil) {
        let url = URL(string: webcamControlUrlString+"/move?movedir=down")
        URLSession.shared.dataTask(with: url!) {(data,response,error) in
            print(String(data: data!, encoding: .utf8) ?? "No return data")
        }.resume()
    }
    
    @objc func webcamMovement(recognizer: UIGestureRecognizer) {
        print("Swiped!!")
        if let recognizer = recognizer as? UISwipeGestureRecognizer {
            if recognizer.direction == .up {
                print("turn up")
                turnUp()
            } else if recognizer.direction == .down {
                print("turn down")
                turnDown()
            } else if recognizer.direction == .right {
                print("turn right")
                turnRight()
            } else if recognizer.direction == .left {
                print("turn left")
                turnLeft()
            }}
    }
    
    @IBAction func reconnect(_ sender: UIButton) {
        let request = URLRequest(url: URL(string: webcamViewUrlString)!)

        webView.load(request)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let request = URLRequest(url: URL(string: webcamViewUrlString)!)

        webView.load(request)
        
        
    }


}

