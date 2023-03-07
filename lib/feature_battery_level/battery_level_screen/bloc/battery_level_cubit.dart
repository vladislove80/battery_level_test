import 'dart:async';

import 'package:battery_level/feature_battery_level/battery_level_screen/bloc/battery_level_state.dart';
import 'package:battery_level/feature_battery_level/battery_provider/battery_platform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BatteryLevelCubit extends Cubit<BatteryLevelState> {
  BatteryLevelCubit(
    this._batteryPlatform, {
    this.alarmBatteryLevel = 20,
  }) : super(BatteryLevelState.empty(alarmBatteryLevel)) {
    _onBatteryStatusChangedSubscription =
        _batteryPlatform.onBatteryLevelChanged.listen((batteryLevel) {
      _batteryLevel = batteryLevel;
      if (_batteryLevel < alarmBatteryLevel) {
        emit(state.copyWith(isBatteryLow: true));
      }
    }, onError: (error, stackTrace) {
      emit(state.copyWith(error: error.toString()));
    });
  }

  int _batteryLevel = 0;
  final int alarmBatteryLevel;

  final BatteryPlatform _batteryPlatform;
  late final StreamSubscription? _onBatteryStatusChangedSubscription;

  void getBatteryLevelPercentage() {
    emit(state.copyWith(batteryLevelPercentage: _batteryLevel));
  }

  void clearErrorMessage() {
    emit(state.copyWith(error: ''));
  }

  @override
  Future<void> close() {
    _onBatteryStatusChangedSubscription?.cancel();
    return super.close();
  }

  static BatteryLevelCubit of(BuildContext context) =>
      BlocProvider.of<BatteryLevelCubit>(context);
}
