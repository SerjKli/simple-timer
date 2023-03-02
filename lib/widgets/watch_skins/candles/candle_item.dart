import 'package:flutter/material.dart';
import 'package:simpletimer/utils/enums/TimerStatus.dart';
import 'package:simpletimer/utils/extensions/beatify.dart';
import 'package:simpletimer/utils/theme/color_schema.dart';
import 'package:simpletimer/utils/theme/extensions/context.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';
import 'package:simpletimer/widgets/app_gap.dart';
import 'package:simpletimer/widgets/app_text.dart';
import 'package:simpletimer/widgets/watch_skins/candles/model/CandleModel.dart';

class CandleItem extends StatefulWidget {
  final int appearingDelay;
  final CandleModel model;

  const CandleItem(
    this.model, {
    Key? key,
    this.appearingDelay = 0,
  }) : super(key: key);

  @override
  State<CandleItem> createState() => _CandleItemState();
}

class _CandleItemState extends State<CandleItem> with TickerProviderStateMixin {
  double scale = 0.65;

  late AnimationController _controller;
  late Animation<double> _animation;

  Color _colorFromStatus(AppColorScheme colorScheme) {
    switch (widget.model.status) {
      case TimerStatus.preparing:
        return colorScheme.success!;
      case TimerStatus.workout:
        return colorScheme.brand!;
      case TimerStatus.rest:
        return colorScheme.light!;
      default:
        return Colors.transparent;
    }
  }

  double _calculateHeight(double maxHeight) {
    return maxHeight * widget.model.percentRemaining / 100;
  }

  @override
  void initState() {
    // Timer(Duration(milliseconds: widget.appearingDelay), () {
    //   width = 60;
    //   margins = UiValues.padding;
    //   setState(() {});
    // });

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1, end: 0.65)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppColorScheme colorScheme = context.colorScheme;

    return ScaleTransition(
      scale: _animation,
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(vertical: UiValues.padding2x),
        width: 40,
        margin: EdgeInsets.symmetric(horizontal: UiValues.padding),
        duration: UiValues.animationSpeed.toMillisecondsDuration,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: LayoutBuilder(builder: (context, constraints) {
                return Stack(
                  children: [
                    /// Background container
                    _BarItem(
                      height: constraints.maxHeight,
                      color: colorScheme.light!.withOpacity(0.2),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: _BarItem(
                        height: _calculateHeight(constraints.maxHeight),
                        color: _colorFromStatus(colorScheme),
                      ),
                    ),
                  ],
                );
              }),
            ),
            const AppGap.vertical(),
            AppText.xs(
              "${widget.model.secondsRemaining}",
              softWrap: false,
            ),
          ],
        ),
      ),
    );
  }
}

class _BarItem extends StatelessWidget {
  final Color color;
  final double height;
  const _BarItem({
    Key? key,
    required this.color,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(UiValues.radiusBig),
        ),
        height: height,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: UiValues.padding),
      );
    });
  }
}
