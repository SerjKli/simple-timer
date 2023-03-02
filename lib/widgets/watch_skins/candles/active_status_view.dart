import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simpletimer/modules/play/ui/widgets/timer_tick_builder.dart';
import 'package:simpletimer/utils/extensions/beatify.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';
import 'package:simpletimer/widgets/watch_skins/candles/model/CandleModel.dart';

import '../../../modules/play/blocs/active_timer/exports.dart';
import 'candles_list_view.dart';

class ActiveStatusView extends StatefulWidget {
  const ActiveStatusView({Key? key}) : super(key: key);

  @override
  State<ActiveStatusView> createState() => _ActiveStatusViewState();
}

class _ActiveStatusViewState extends State<ActiveStatusView> {
  PageController pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.24,
  );

  List<CandleModel> _generateCandles(ActiveTimerState state) {
    return state.stages.asMap().entries.map((entry) {
      return CandleModel.fromTimerStageModel(
        timerStage: entry.value,
        secondsPast: 0,
        isActive: state.stageIndex == entry.key,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return BlocConsumer<ActiveTimerBloc, ActiveTimerState>(
        builder: (context, state) {
          final candles = _generateCandles(state);

          return SizedBox(
            height: constraints.maxHeight,
            child: TimerTickBuilder(
              builder: (context, int? seconds) {
                return CandlesListView(
                  candles,
                  pageController: pageController,
                );
              }
            ),
          );
        },
        listenWhen: (previousState, state) {
          return previousState.stageIndex != state.stageIndex;
        },
        listener: (context, state) {
          pageController.animateToPage(
            state.stageIndex,
            duration: UiValues.animationSpeed.toMillisecondsDuration,
            curve: Curves.linear,
          );
        },
      );
    });
  }
}
