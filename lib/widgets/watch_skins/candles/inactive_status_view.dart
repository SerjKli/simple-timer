import 'package:flutter/material.dart';
import 'package:simpletimer/utils/enums/TimerStatus.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';
import 'package:simpletimer/widgets/watch_skins/candles/candle_item.dart';
import 'package:simpletimer/widgets/watch_skins/candles/candles_list_view.dart';

import 'model/CandleModel.dart';

class InactiveStatusView extends StatelessWidget {
  static const List<CandleModel> candles = [
    CandleModel(
      status: TimerStatus.preparing,
      totalSeconds: 15,
      secondsPast: 15,
      isActive: false,
    ),
    CandleModel(
      status: TimerStatus.workout,
      totalSeconds: 60,
      secondsPast: 60,
      isActive: false,
    ),
    CandleModel(
      status: TimerStatus.rest,
      totalSeconds: 30,
      secondsPast: 12,
      isActive: true,
    ),
    CandleModel(
      status: TimerStatus.workout,
      totalSeconds: 60,
      secondsPast: 0,
      isActive: false,
    ),
    CandleModel(
      status: TimerStatus.rest,
      totalSeconds: 30,
      secondsPast: 0,
      isActive: false,
    ),
    // CandleModel(
    //   status: TimerStatus.workout,
    //   totalSeconds: 60,
    //   secondsPast: 0,
    //   isActive: false,
    // ),
    // CandleModel(
    //   status: TimerStatus.rest,
    //   totalSeconds: 30,
    //   secondsPast: 0,
    //   isActive: false,
    // ),
  ];

  final Widget? child;

  const InactiveStatusView(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            SizedBox(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: Center(
                child: CandlesListView(
                  candles,
                  pageController: PageController(initialPage: 2, viewportFraction: 0.2),
                ),
              ),
            ),
            if (child != null)
              Container(
                alignment: Alignment.center,
                padding: UiValues.paddingEdgeMax,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(constraints.maxHeight)),
                  color: Colors.black.withOpacity(0.8),
                ),
                child: child,
              ),
          ],
        );
      },
    );
  }
}
