import 'package:flutter/material.dart';
import 'package:simpletimer/utils/extensions/beatify.dart';

import 'statistic_item.dart';

enum _DurationDisplayType {
  seconds,
  minutes,
  hours,
  days,
}

class StatisticDurationItem extends StatefulWidget {
  final int seconds;

  const StatisticDurationItem(this.seconds, {Key? key}) : super(key: key);

  @override
  State<StatisticDurationItem> createState() => _StatisticDurationItemState();
}

class _StatisticDurationItemState extends State<StatisticDurationItem> {
  final List<_DurationDisplayType> _types = const [
    _DurationDisplayType.seconds,
    _DurationDisplayType.minutes,
    _DurationDisplayType.hours,
    _DurationDisplayType.days,
  ];

  int _typeIndex = 0;

  double get minutes => widget.seconds / 60;

  double get hours => widget.seconds / (60 * 60);

  double get days => widget.seconds / (60 * 60 * 24);

  _DurationDisplayType get _currentType => _types[_typeIndex];

  void _changeDisplayType() {
    final newIndex = _typeIndex == _types.length - 1 ? 0 : _typeIndex + 1;

    setState(() {
      _typeIndex = newIndex;
    });
  }

  String get _getDurationByDisplayType {
    switch (_currentType) {
      case _DurationDisplayType.seconds:
        return widget.seconds.toString();
      case _DurationDisplayType.minutes:
        return minutes.toStringAsFixed(4);
      case _DurationDisplayType.hours:
        return hours.toStringAsFixed(4);
      case _DurationDisplayType.days:
        return days.toStringAsFixed(4);
      default:
        return widget.seconds.toString();
    }
  }

  String get _getDisplayTitle {
    return "Total ${_currentType.toShortString()}";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _changeDisplayType(),
      child: StatisticItem(
        title: _getDisplayTitle,
        value: _getDurationByDisplayType,
      ),
    );
  }
}
