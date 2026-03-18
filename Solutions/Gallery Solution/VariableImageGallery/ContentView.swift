
//
//  ContentView.swift
//  VariableImageGallery
//
//  Created by Chad Hinds on 2/22/26.
//

import SwiftUI
import AVFoundation

// model used to pair image + sound
struct GalleryItem: Identifiable {
    let id = UUID()
    let imageName: String
    let soundName: String
}

struct ContentView: View {
    
    // Your data
    let picList: [GalleryItem] = [
        GalleryItem(imageName: "faaah", soundName: "faaah"),
        GalleryItem(imageName: "airhorn", soundName: "airhorn"),
        GalleryItem(imageName: "mr krabs", soundName: "mr krabs"),
        GalleryItem(imageName: "rip", soundName: "rip"),
    ]
    
    // Audio player state
    @State private var audioPlayer: AVAudioPlayer?
    @State private var currentPlayingSound: String?
    
    // Toggle play/pause
    func togglePlayPause(soundName: String) {
        if currentPlayingSound == soundName {
            if audioPlayer?.isPlaying == true {
                audioPlayer?.pause()
            } else {
                audioPlayer?.play()
            }
        } else {
            // Stop previous sound if different one is tapped
            if let currentPlayer = audioPlayer, currentPlayer.isPlaying {
                currentPlayer.stop()
            }
            playSong(named: soundName)
        }
    }
    
    // Play function
    func playSong(named soundName: String) {
        // this line basically says: "Find the MP3 file inside my app"
        if let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") {
            do {
                audioPlayer?.stop() // stop previous sound
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
                currentPlayingSound = soundName // Track the currently playing sound
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        } else {
            print("File not found: \(soundName).mp3")
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(picList) {
                    item in CustomImage(imageName: item.imageName, borderSize: 4, borderColor: .green ,shadowRadius: 5)
                        .onTapGesture {
                                               togglePlayPause( soundName: item.soundName)
                                           }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
