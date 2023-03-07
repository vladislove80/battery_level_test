package com.test.battery_level

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel

class MainActivity : FlutterActivity() {
    private val eventChannelName = "com.test/batteryLevel";
    private lateinit var eventChannel: EventChannel

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        eventChannel = EventChannel(flutterEngine.dartExecutor.binaryMessenger, eventChannelName).also {
            it.setStreamHandler(BatteryEventsStreamHandler(context))
        }
    }
}
