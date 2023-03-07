class BatteryLevelState {
  const BatteryLevelState({
    required this.alarmBatteryLevel,
    this.batteryLevelPercentage = -1,
    this.isBatteryLow = false,
    this.error = '',
  });

  factory BatteryLevelState.empty(int alarmBatteryLevel) =>
      BatteryLevelState(alarmBatteryLevel: alarmBatteryLevel);

  final int batteryLevelPercentage;
  final bool isBatteryLow;
  final String error;
  final int alarmBatteryLevel;

  BatteryLevelState copyWith({
    int? batteryLevelPercentage,
    int? alarmBatteryLevel,
    bool? isBatteryLow,
    String? error,
  }) =>
      BatteryLevelState(
        batteryLevelPercentage:
            batteryLevelPercentage ?? this.batteryLevelPercentage,
        alarmBatteryLevel: alarmBatteryLevel ?? this.alarmBatteryLevel,
        isBatteryLow: isBatteryLow ?? this.isBatteryLow,
        error: error ?? this.error,
      );
}
