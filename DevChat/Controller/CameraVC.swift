//
//  CameraVC.swift
//  DevChat
//
//  Created by Brennan Linse on 2/11/18.
//  Copyright © 2018 Brennan Linse. All rights reserved.
//

import UIKit

class CameraVC: AppleCameraViewController {

    @IBOutlet weak var previewView: ApplePreviewView!
    
    override func viewDidLoad() {
        self._previewView = self.previewView

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

