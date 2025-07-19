import Flutter
import UIKit
import AVFoundation

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
      _ application: UIApplication,
      didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(name: "com.kashif.sensor.device_sensor_app", binaryMessenger: controller.binaryMessenger)

    channel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
      switch call.method {
      case "getBatteryLevel":
        UIDevice.current.isBatteryMonitoringEnabled = true
        let level = UIDevice.current.batteryLevel
        if level >= 0 {
          result(Int(level * 100))
        } else {
          result(-1) // Indicate battery level unavailable
        }
      case "getDeviceName":
        print("OS Version: \(UIDevice.current.name)") // Debugging
        result(UIDevice.current.name)
      case "getOsVersion":
        print("Device model: \(UIDevice.current.systemVersion)") // Debugging
        result(UIDevice.current.systemVersion)
      case "toggleFlashlight":
        result(self.toggleFlashlight())
      default:
        result(FlutterMethodNotImplemented)
      }
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private var isFlashlightOn = false

  private func toggleFlashlight() -> Bool {
    guard let device = AVCaptureDevice.default(for: .video), device.hasTorch else {
      return false
    }

    do {
      try device.lockForConfiguration()
      isFlashlightOn = !isFlashlightOn
      device.torchMode = isFlashlightOn ? .on : .off
      device.unlockForConfiguration()
      return isFlashlightOn
    } catch {
      print("Error toggling flashlight: \(error)")
      return false
    }
  }
}