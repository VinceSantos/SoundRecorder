//
//  AudioRecorderService.swift
//  Wubba Lubba Dub Dub
//
//  Created by Vince Carlo Santos on 15/05/2020.
//  Copyright © 2020 Vince Carlo Santos. All rights reserved.
//

import Foundation
import AVFoundation

class AudioRecorderService: NSObject, AVAudioPlayerDelegate, AVAudioRecorderDelegate {
    var soundRecorder: AVAudioRecorder!
    var soundPlayer: AVAudioPlayer = AVAudioPlayer()
    var audioSession: AVAudioSession = AVAudioSession()
    var audioEngine: AVAudioEngine = AVAudioEngine()
    var mixer: AVAudioMixerNode = AVAudioMixerNode()
    var fileName = "101.m4a"
    var isRecording = false
    
    override init() {
        audioSession = AVAudioSession.sharedInstance()
        do {
            try AVAudioSession.sharedInstance().setCategory(.multiRoute, mode: .default, options: [])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print(error)
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    public func initializeRecorder() {
        let audioFileName = getDocumentsDirectory().appendingPathComponent(fileName)
        let recordSetting = [AVFormatIDKey: kAudioFormatAppleLossless,
                             AVEncoderAudioQualityKey: AVAudioQuality.max.rawValue,
                             AVEncoderBitRateKey: 32000,
                             AVNumberOfChannelsKey: 2,
        AVSampleRateKey: 44100.0] as [String: Any]
        
        do {
            soundRecorder = try AVAudioRecorder(url: audioFileName, settings: recordSetting)
            soundRecorder.delegate = self
            soundRecorder.prepareToRecord()
        } catch {
            print(error)
        }
    }
    
    public func playAudio() {
        let audioFileName = getDocumentsDirectory().appendingPathComponent(fileName)
        print(audioFileName)
        do {
            soundPlayer = try AVAudioPlayer(contentsOf: audioFileName)
            soundPlayer.delegate = self
            soundPlayer.prepareToPlay()
            soundPlayer.volume = 1.0
            soundPlayer.play()
        } catch {
            print(error)
        }
        
    }
    
    public func startRecording() {
        soundRecorder.record()
        isRecording = true
    }
    
    public func stopRecording() {
        soundRecorder.stop()
        isRecording = false
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        print(recorder.url)
        print("stop recording")
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("stop")
    }
}
