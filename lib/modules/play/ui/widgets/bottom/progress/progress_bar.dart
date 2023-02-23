import 'package:flutter/material.dart';
import 'package:simpletimer/utils/theme/extensions/context.dart';

import '../../../../blocs/active_timer/exports.dart';

class ProgressBar extends StatefulWidget {
  final double height;
  final Duration animationSpeed;

  const ProgressBar({
    Key? key,
    required this.height,
    required this.animationSpeed,
  }) : super(key: key);

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ActiveTimerBloc, ActiveTimerState>(
      listener: (context, state) {
        setState(() {
          progress = state.progressPercent;
        });
      },
      child: LayoutBuilder(builder: (context, constraints) {
        return AnimatedContainer(
          duration: widget.animationSpeed,
          height: widget.height,
          width: constraints.maxWidth * progress / 100,
          color: context.colorScheme.subBrand,
        );
      }),
    );
  }
}
