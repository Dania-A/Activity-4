//
//  RecordingViewController.swift
//  PitchPerfectProject
//
//  Created by Dania A on 01/07/2018.
//  Copyright © 2018 Udacity. All rights reserved.
//

import UIKit
import AVFoundation

//TODO: Make this class conform to the protocol called AVAudioRecorderDelegate

class RecordingViewController: UIViewController {
    
    //Define a global variable for the recorder
    var recorder: AVAudioRecorder!
    
    @IBOutlet weak var recordingButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var recordingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopButton.isEnabled = false
    }
    
    @IBAction func recordAudio(_ sender: Any) {
        //Disable the record button, enable the stop button, and update the label:
        updateUI(recording: true)
        
        //Set the path where the file should be stored
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        
        //Set the file name
        let recordingName = "recordedVoice.wav"
        
        //Prepare the full path as two elements in a String array
        let pathArray = [dirPath, recordingName]
        
        //Create a URL for the path by sending the full String value of the path
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        //Get the AVAudioSession that is shared in the device
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default)
        
        //Try to initialize the recorder using the path URL without handling any resulting exception
        try! recorder = AVAudioRecorder(url: filePath!, settings: [:])
        
        
        //TODO: Set the deligate of the recorder to be this class
        
        recorder.isMeteringEnabled = true
        
        //Prepare the recorder then start recording
        recorder.prepareToRecord()
        recorder.record()
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        //Disable the stop button, enable the record button, and update the label:
        updateUI(recording: false)
        
        //Stop the recorder
        recorder.stop()
        
        //Get the audio session and deactivate it
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    //TODO: Implement audioRecorderDidFinishRecording, if the recording is successfully completed, perform a segue to go to the login screen. **Don't forget to add that segue on the storyboard and give it an identifier so you can refer to it through that identifier**
    
   
    
    //TODO: Implement prepare for segue, and set the URL value of the recording in the login ViewController to be the same as this one. 
    
    
    func updateUI (recording: Bool){
        if (recording){
            recordingButton.isEnabled = false
            stopButton.isEnabled = true
            recordingLabel.text = "Recording in progress"
        } else {
            recordingButton.isEnabled = true
            stopButton.isEnabled = false
            recordingLabel.text = "Tab to record"
        }
    }
}
