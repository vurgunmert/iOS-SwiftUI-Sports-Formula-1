//
//  ExperimentHome.swift
//  sports-formula1
//
//  Created by Vurgun on 27.08.2023.
//

import SwiftUI
import AVKit

struct HighlightPlayer: View {
    
    let size: CGSize
    @State private var player: AVPlayer? = {
        if let bundle = Bundle.main.path(forResource: "race_canada_23", ofType: "mp4"){
            return .init(url: URL(filePath: bundle))
        }
        return nil
    }()
    
    @State private var showPlayerControls: Bool = false
    @State private var isPLaying: Bool = false
    @State private var controlsTimeoutTask: DispatchWorkItem?
    
    //Seeker properties
    @GestureState private var isDragging: Bool = false
    @State private var progress: CGFloat = 0
    @State private var lastDraggedProgress: CGFloat = 0
    
    var body: some View {
        
        ZStack {
            if let player {
                CustomVideoPlayer(player: player)
                    .overlay {
                        Rectangle()
                            .fill(.black.opacity(0.4))
                            .opacity(showPlayerControls || isDragging ? 1 : 0)
                        // Animate dragging state
                            .animation(.easeInOut(duration: 0.35), value: isDragging)
                            .overlay {
                                PlaybackControls()
                            }
                    }
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.35)) {
                            showPlayerControls.toggle()
                        }
                        //timeout if playing
                        
                        if isPLaying {
                            timeoutControls()
                        }
                    }
                    .overlay(alignment: .bottom) {
                        VideoSeekerView(size)
                    }
            }
        }.frame(width: size.width, height: size.height)
    }
    
    //Video seeker view
    @ViewBuilder
    func VideoSeekerView(_ videoSize: CGSize) -> some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .fill(.gray)
            
            Rectangle()
                .fill(.red)
                .frame(width: max(videoSize.width * progress, 0))
            
        }
        .frame(height: 3)
        .onTapGesture(coordinateSpace: .global) { location in
            let calculatedProgress = (location.x/videoSize.width)
            progress = calculatedProgress
            
            lastDraggedProgress = progress
            //seek to dragged time
            if let currentPlayerTime = player?.currentItem {
                let totalDuration = currentPlayerTime.duration.seconds
                player?.seek(to: CMTime.init(seconds: totalDuration * progress, preferredTimescale: 1))
                
                //restart timeout task
                if isPLaying {
                    timeoutControls()
                }
            }
        }
        .overlay(alignment: .leading) {
            Circle()
                .fill(.red)
                .frame(width: 12, height: 12)
            //drag space - pick larger for ease of use
                .frame(width: 50, height: 50)
                .frame(width: 12, height: 12)
                .contentShape(Rectangle())
            //Move along with gesture progress
                .offset(x: videoSize.width * progress)
                .gesture(
                    DragGesture()
                        .updating($isDragging, body: { _, out, _ in
                            out = true
                        })
                        .onChanged({value in
                            //cancel living timeout task
                            if let controlsTimeoutTask {
                                controlsTimeoutTask.cancel()
                            }
                            //calculate progress
                            let translationX: CGFloat = value.translation.width
                            let calculatedProgress = (translationX/videoSize.width) + lastDraggedProgress
                            progress = max(min(calculatedProgress, 1), 0)
                        })
                        .onEnded({value in
                            //store last known progress
                            lastDraggedProgress = progress
                            //seek to dragged time
                            if let currentPlayerTime = player?.currentItem {
                                let totalDuration = currentPlayerTime.duration.seconds
                                player?.seek(to: CMTime.init(seconds: totalDuration * progress, preferredTimescale: 1))
                                
                                //restart timeout task
                                if isPLaying {
                                    timeoutControls()
                                }
                            }
                        })
                )
        }
    }
    
    //PLayback controls view
    @ViewBuilder
    func PlaybackControls() -> some View {
        HStack(spacing: 25) {
            Button {
                //Change video status
                if isPLaying {
                    //pause
                    player?.pause()
                    //cancel timeout task while paused
                    if let controlsTimeoutTask {
                        controlsTimeoutTask.cancel()
                    }
                } else {
                    //play
                    player?.play()
                    timeoutControls()
                }
                
                withAnimation(.easeOut(duration: 0.2)) {
                    isPLaying.toggle()
                }
            } label: {
                //Chane icon based on status
                Image(systemName: isPLaying ? "pause.fill" : "play.fill")
                    .fontWeight(.ultraLight)
                    .foregroundColor(.white)
                    .padding(15)
                    .background {
                        Circle()
                            .fill(.black.opacity(0.35))
                    }
            }
            
        }
        .opacity(showPlayerControls && !isDragging ? 1 : 0)
        .animation(.easeInOut(duration: 0.2), value: showPlayerControls && !isDragging)
    }
    
    
    //auto hide/Timeout player controls after some time
    func timeoutControls() {
        if let controlsTimeoutTask {
            controlsTimeoutTask.cancel()
        }
        
        controlsTimeoutTask = .init(block: {
            withAnimation(.easeInOut(duration: 0.35)) {
                showPlayerControls = false
            }
        })
        
        //Schedule task
        if let controlsTimeoutTask {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: controlsTimeoutTask)
        }
    }
    
    
}

struct HighlightPlayer_Previews: PreviewProvider {
    static var previews: some View {
        HighlightPlayer(size: .init(width: 400, height: 200))
    }
}
