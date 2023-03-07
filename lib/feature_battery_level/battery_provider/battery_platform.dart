import 'package:battery_level/feature_battery_level/battery_provider/battery_data_provider.dart';
import 'package:battery_level/feature_battery_level/battery_provider/platform_interface.dart';

abstract class BatteryPlatform extends PlatformInterface {
  BatteryPlatform() : super(token: _token);

  static final Object _token = Object();

  static BatteryPlatform _instance = BatteryDataProvider();

  static BatteryPlatform get instance => _instance;

  static set instance(BatteryPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Stream<int> get onBatteryLevelChanged {
    throw UnimplementedError(
        'get onBatteryStateChanged has not been implemented.');
  }
}
