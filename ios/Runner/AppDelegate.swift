import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  var flutterEngine: FlutterEngine?
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    self.flutterEngine = FlutterEngine(name: "my_flutter_engine")
    self.flutterEngine?.run()
    let eventChannel = FlutterEventChannel(name: "com.test/batteryLevel", binaryMessenger: self.flutterEngine!.binaryMessenger)
    eventChannel.setStreamHandler(BatteryLevelStreamHandler())

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
