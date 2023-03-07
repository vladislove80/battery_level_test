import 'package:battery_level/feature_battery_level/battery_level_screen/bloc/battery_level_cubit.dart';
import 'package:battery_level/feature_battery_level/battery_level_screen/view/battery_level_view.dart';
import 'package:battery_level/feature_battery_level/battery_provider/battery_platform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BatteryLevelScreen extends StatelessWidget {
  const BatteryLevelScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => BatteryLevelCubit(
          BatteryPlatform.instance,
        ),
        child: const BatteryLevelView(),
      );
}
