//
//  MotionManager.swift
//  Gravity
//
//  Created by Hidayat Abisena on 17/12/23.
//

import CoreMotion
import Combine

class MotionManager: ObservableObject {
    private var motionManager: CMMotionManager
    @Published var accelerometerData: CMAccelerometerData?
    @Published var gyroData: CMGyroData?

    init() {
        self.motionManager = CMMotionManager()
        self.motionManager.accelerometerUpdateInterval = 1 / 60 // 60 Hz
        self.motionManager.gyroUpdateInterval = 1 / 60

        if self.motionManager.isAccelerometerAvailable {
            self.motionManager.startAccelerometerUpdates(to: .main) { [weak self] (data, error) in
                self?.accelerometerData = data
            }
        }

        if self.motionManager.isGyroAvailable {
            self.motionManager.startGyroUpdates(to: .main) { [weak self] (data, error) in
                self?.gyroData = data
            }
        }
    }
}
