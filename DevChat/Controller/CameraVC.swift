//
//  CameraVC.swift
//  DevChat
//
//  Created by Brennan Linse on 2/11/18.
//  Copyright © 2018 Brennan Linse. All rights reserved.
//

import UIKit
import FirebaseAuth

class CameraVC: AppleCameraViewController, AppleCameraVCDelegate {
    
    
    @IBOutlet weak var previewView: ApplePreviewView!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var switchCameraButton: UIButton!
    
    
    override func viewDidLoad() {
        self._previewView = self.previewView
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        super.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        guard Auth.auth().currentUser != nil else {
            // Load login screen if nobody is logged in.
            performSegue(withIdentifier: "toLoginVC", sender: nil)
            return
        }
    }
    
    @IBAction func recordButtonPressed(_ sender: Any) {
        toggleMovieRecording()
    }
    
    @IBAction func changeCameraButtonPressed(_ sender: Any) {
        changeCamera()
    }
    
    // Implementing delegate methods from AppleCameraVCDelegate
    func shouldEnableRecordUI(_ enable: Bool) {
        self.recordButton.isEnabled = enable
    }
    
    func shouldEnableCameraUI(_ enable: Bool) {
        self.switchCameraButton.isEnabled = enable
    }
    
    func didStartRecording() {
        print("Brennan - didStartRecording")
    }
    
    func canStartRecording() {
        print("Brennan - canStartRecording")
    }

    
    
    


}

