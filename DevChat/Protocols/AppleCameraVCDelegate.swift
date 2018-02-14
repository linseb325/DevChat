//
//  AppleCameraVCDelegate.swift
//  DevChat
//
//  Created by Brennan Linse on 2/13/18.
//  Copyright © 2018 Brennan Linse. All rights reserved.
//

import Foundation

protocol AppleCameraVCDelegate {
    func shouldEnableRecordUI(_ enable: Bool)
    func shouldEnableCameraUI(_ enable: Bool)
    func didStartRecording()
    func canStartRecording()
}
