//
//  Animations.swift
//  Custom alert
//
//  Created by Abdullah Alnutayfi on 22/04/2022.
//

import Foundation
import UIKit
import AVFAudio

var audioPlayer: AVAudioPlayer!
func animateLogo(view: UIView) {
    UIView.transition(with: view, duration: 1.0, options: .transitionFlipFromBottom, animations: {
    }) { _ in
    }
    
    }

func animateAleart(alert: UIView, logo: UIImageView, image: String, color: UIColor){
    print("Alert dismissed")
    CustomAlert.animate(withDuration: 0.70, delay: 0, options: [.curveEaseOut],
                        animations: { [] in
        alert.center.y += UIScreen.main.bounds.height / 2 + 100
      alert.layoutIfNeeded()

        },  completion: {(_ completed: Bool) -> Void in
            alert.isHidden = true
            logo.tintColor = color
           logo.isHidden = false
           logo.image = UIImage(systemName: image)
            })
    animateLogo(view: logo)
    DispatchQueue.main.asyncAfter(deadline: .now()+2){
       logo.isHidden = true
    }
}
func playAudio(_ assetName : String) {
   guard let audioData = NSDataAsset(name: assetName)?.data else {
      fatalError("Unable to find asset \(assetName)")
   }
   do {
      audioPlayer = try AVAudioPlayer(data: audioData)
      audioPlayer.play()
   } catch {
      fatalError(error.localizedDescription)
 }
}
