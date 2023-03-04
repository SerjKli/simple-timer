import 'package:flutter/material.dart';
import 'package:simpletimer/widgets/app_screen.dart';

import '../blocks/statistic/exports.dart';
import 'widgets/clear_statistic_button.dart';
import 'widgets/duration_item.dart';
import 'widgets/helper_button.dart';
import 'widgets/statistic_item.dart';

class StatisticScreen extends StatelessWidget {
  static const String routeName = "/statistic";

  const StatisticScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      screenTitle: "Statistic",
      actions: const [
        ClearStatisticButton(),
        HelperButton(),
      ],
      body: BlocBuilder<StatisticBloc, StatisticState>(
        builder: (context, state) {
          return SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                StatisticDurationItem(state.seconds),
                StatisticItem(
                  title: "Total stages",
                  value: state.stages.toString(),
                ),
                StatisticItem(
                  title: "Total trainings",
                  value: state.trainings.toString(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _St extends StatelessWidget {
  const _St({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
