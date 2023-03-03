import 'package:flutter/material.dart';
import 'package:simpletimer/modules/play/ui/widgets/timer_tick_builder.dart';
import 'package:simpletimer/utils/extensions/beatify.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';
import 'package:simpletimer/widgets/watch_skins/candles_skin/candle_item.dart';
import 'package:simpletimer/widgets/watch_skins/candles_skin/model/CandleModel.dart';

import '../../../modules/play/blocs/active_timer/exports.dart';

class ActiveStatusView extends StatefulWidget {
  const ActiveStatusView({Key? key}) : super(key: key);

  @override
  State<ActiveStatusView> createState() => _ActiveStatusViewState();
}

class _ActiveStatusViewState extends State<ActiveStatusView> {
  PageController pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.20,
  );

  List<CandleModel> _generateCandles(ActiveTimerState state) {
    return state.stages.asMap().entries.map((entry) {
      return CandleModel.fromTimerStageModel(
        timerStage: entry.value,
        secondsRemaining: entry.value.duration,
        isActive: state.stageIndex == entry.key,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return BlocConsumer<ActiveTimerBloc, ActiveTimerState>(
        listener: (_, state) {
          pageController.animateToPage(
            state.stageIndex,
            duration: UiValues.animationSpeed.toMillisecondsDuration,
            curve: Curves.linear,
          );
        },
        listenWhen: (previousState, state) {
          return previousState.stageIndex != state.stageIndex;
        },
        builder: (_, state) {
          final candles = _generateCandles(state);
          return TimerTickBuilder(builder: (context, int? secondsRemaining) {
            return PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              itemCount: candles.length,
              itemBuilder: (_, int pageIndex) {
                CandleModel candle = candles[pageIndex];

                if (state.stageIndex > pageIndex) {
                  candle = candle.copyWith(secondsRemaining: 0);
                } else if (secondsRemaining != null && candle.isActive) {
                  candle = candle.copyWith(secondsRemaining: secondsRemaining);
                }

                return CandleItem(candle);
              },
            );
          });
        },
      );
    });
  }
}
