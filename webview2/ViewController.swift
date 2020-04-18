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

    let webcamControlUrl = "http://172.20.97.149:5000"
    @IBOutlet weak var webView: WKWebView!
    @IBAction func turnUp(_ sender: UIButton? = nil) {
        let url = URL(string: webcamControlUrl+"/move?movedir=up")
        URLSession.shared.dataTask(with: url!) {(data,response,error) in
            print(String(data: data!, encoding: .utf8) ?? "No return data")
        }.resume()
    }
    
    @IBAction func turnLeft(_ sender: UIButton? = nil) {
        let url = URL(string: webcamControlUrl+"/move?movedir=left")
        URLSession.shared.dataTask(with: url!) {(data,response,error) in
            print(String(data: data!, encoding: .utf8) ?? "No return data")
        }.resume()
    }
    
    @IBAction func center(_ sender: UIButton) {
        let url = URL(string: webcamControlUrl+"/move?movedir=center")
        URLSession.shared.dataTask(with: url!) {(data,response,error) in
            print(String(data: data!, encoding: .utf8) ?? "No return data")
        }.resume()
    }
    
    @IBAction func turnRight(_ sender: UIButton? = nil) {
        let url = URL(string: webcamControlUrl+"/move?movedir=right")
        URLSession.shared.dataTask(with: url!) {(data,response,error) in
            print(String(data: data!, encoding: .utf8) ?? "No return data")
        }.resume()
    }
    
    @IBAction func turnDown(_ sender: Any? = nil) {
        let url = URL(string: webcamControlUrl+"/move?movedir=down")
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
    
    @IBOutlet weak var webcamMoveView: UIView!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(webcamMovement(recognizer:)))
        swipeLeft.direction = .left
        webcamMoveView.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(webcamMovement(recognizer:)))
        swipeRight.direction = .right
        webcamMoveView.addGestureRecognizer(swipeRight)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(webcamMovement(recognizer:)))
        swipeUp.direction = .up
        webcamMoveView.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(webcamMovement(recognizer:)))
        swipeDown.direction = .down
        webcamMoveView.addGestureRecognizer(swipeDown)
    
        let request = URLRequest(url: URL(string: "http://172.20.97.149:8081")!)

        webView.load(request)
        
        
    }


}

