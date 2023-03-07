import 'package:flutter/material.dart';
import 'package:simpletimer/modules/play/ui/widgets/timer_tick_builder.dart';
import 'package:simpletimer/widgets/nothing.dart';

import 'candle_item.dart';
import 'model/CandleModel.dart';

class CandlesListView extends StatelessWidget {
  final PageController pageController;
  final List<CandleModel> candles;
  final bool useTimerTicker;

  const CandlesListView(
    this.candles, {
    Key? key,
    required this.pageController,
    this.useTimerTicker = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: candles.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, int index) {
        final CandleModel candleModel = candles[index];
        if (useTimerTicker) {
          return TimerTickBuilder(builder: (_, int? seconds) {
            if (seconds == null) return const Nothing();
            if (candleModel.isActive) {
              return CandleItem(
                candleModel.copyWith(secondsRemaining: seconds),
              );
            } else {
              return CandleItem(candleModel);
            }
          });
        }
        return CandleItem(candleModel);
      },
    );
  }
}
