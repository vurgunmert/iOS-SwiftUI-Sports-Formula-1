//
//  CustomVideoPlayer.swift
//  sports-formula1
//
//  Created by Vurgun on 28.08.2023.
//

import SwiftUI
import AVKit

struct CustomVideoPlayer: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = AVPlayerViewController
        
    var player: AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        /* */
    }
}
