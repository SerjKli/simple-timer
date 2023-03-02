import 'package:flutter/material.dart';

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
        return CandleItem(
          candles[index],
        );
      },
    );
  }
}
