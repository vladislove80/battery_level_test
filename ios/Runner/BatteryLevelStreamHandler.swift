import Flutter

class BatteryLevelStreamHandler: NSObject, FlutterStreamHandler {
    private var eventSink: FlutterEventSink?
    
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        self.eventSink = events
        UIDevice.current.isBatteryMonitoringEnabled = true
        NotificationCenter.default.addObserver(self, selector: #selector(onBatteryLevelChange), name: UIDevice.batteryLevelDidChangeNotification, object: nil)
        return nil
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        UIDevice.current.isBatteryMonitoringEnabled = false
        NotificationCenter.default.removeObserver(self)
        eventSink = nil
        return nil
    }
    
    @objc private func onBatteryLevelChange() {
        let batteryLevel = UIDevice.current.batteryLevel
        eventSink?(Int(batteryLevel * 100))
    }
}
