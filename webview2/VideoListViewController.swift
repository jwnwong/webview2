//
//  VideoListViewController.swift
//  webview2
//
//  Created by Jason Wong on 29/4/2020.
//  Copyright © 2020 Papa. All rights reserved.
//

import UIKit
import AVKit
class VideoListViewController: UIViewController {

    
  
    @IBAction func PlayVideo(_ sender: UIButton) {
        
    // let videoURL = URL(string: "http://172.20.97.149:5000/static/01-20200501124842.mkv")
    // let videoURL = URL(string: "https://wolverine.raywenderlich.com/content/ios/tutorials/video_streaming/foxVillage.mp4")
    // let videoURL = URL(string: "http://172.20.97.149:5000/static/foxVillage.mp4")
      
        let videoPath = Bundle.main.path(forResource: "20200501-timelapse", ofType: "mpg")
        let videoURL = URL(fileURLWithPath: videoPath!)
        print(videoURL)
        let playerViewController = AVPlayerViewController()
        let player = AVKit.AVPlayer(url: videoURL)

        playerViewController.player = player

        present(playerViewController, animated: true) {
            player.play()
        }
    }
   
}
