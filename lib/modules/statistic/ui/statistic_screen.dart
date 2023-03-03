import 'package:flutter/material.dart';
import 'package:simpletimer/modules/statistic/ui/widgets/statistic_item.dart';
import 'package:simpletimer/widgets/app_screen.dart';

import '../blocks/statistic/exports.dart';
import 'widgets/clear_statistic_button.dart';

class StatisticScreen extends StatelessWidget {
  static const String routeName = "/statistic";

  const StatisticScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      screenTitle: "Statistic",
      actions: const [
        ClearStatisticButton(),
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
                StatisticItem(
                  title: "Total seconds",
                  value: state.seconds,
                ),
                StatisticItem(
                  title: "Total stages",
                  value: state.stages,
                ),
                StatisticItem(
                  title: "Total trainings",
                  value: state.trainings,
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
