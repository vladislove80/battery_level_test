import 'package:battery_level/feature_battery_level/battery_provider/battery_platform.dart';
import 'package:flutter/services.dart';

class BatteryDataProvider extends BatteryPlatform {

  final eventChannel = const EventChannel('com.test/batteryLevel');

  Stream<int>? _onBatteryStateChanged;

  @override
  Stream<int> get onBatteryLevelChanged => _onBatteryStateChanged ??= eventChannel
        .receiveBroadcastStream()
        .map((dynamic result) => result);
}
