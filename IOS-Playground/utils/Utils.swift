//
//  Utils.swift
//  IOS-Playground
//
//  Created by Roman Makeev on 28.12.2022.
//

import Foundation
import UIKit
import AudioToolbox

class Utils {
    static func vibrate() {
        AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) { }
    }
}
