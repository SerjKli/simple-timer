import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/modules/statistic/blocks/statistic/exports.dart';
import 'package:simpletimer/widgets/app_icon_button.dart';

import 'clear_statistic_dialog.dart';

class ClearStatisticButton extends StatelessWidget {
  const ClearStatisticButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      icon: FontAwesomeIcons.eraser,
      onPressed: () async {
        final confirmed = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return const ClearStatisticDialog();
          },
        );
        if (confirmed) {
          context.read<StatisticBloc>().add(const ClearStatisticEvent());
        }
      },
    );
  }
}
