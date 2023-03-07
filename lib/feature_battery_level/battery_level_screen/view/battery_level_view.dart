import 'package:battery_level/feature_battery_level/battery_level_screen/bloc/battery_level_cubit.dart';
import 'package:battery_level/feature_battery_level/battery_level_screen/bloc/battery_level_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BatteryLevelView extends StatelessWidget {
  const BatteryLevelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: BlocListener<BatteryLevelCubit, BatteryLevelState>(
        listener: (context, state) {
          if (state.isBatteryLow) {
            _buildDialog(
                context, 'Your battery is lower ${state.alarmBatteryLevel}');
          }
          if (state.error.isNotEmpty) {
            _buildDialog(context, 'Some error occurs: ${state.error}',
                onDismiss: (){
                  BatteryLevelCubit.of(context).clearErrorMessage();
                }
            );
          }
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<BatteryLevelCubit, BatteryLevelState>(
                  builder: (context, state) {
                var batteryLevelPercentage = state.batteryLevelPercentage;
                final label = batteryLevelPercentage == -1
                    ? 'Battery level should be checked'
                    : 'Battery level  is $batteryLevelPercentage';
                return Text(
                  label,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20,
                  ),
                );
              }),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  BatteryLevelCubit.of(context).getBatteryLevelPercentage();
                },
                child: const Text('Check battery level'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _buildDialog(
    BuildContext context,
    String message, {
    Function? onDismiss,
  }) {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            backgroundColor: Colors.blue[100],
            title: const Text('Alert!'),
            content: Text(message),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('OK'),
                onPressed: () {
                  onDismiss?.call();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
