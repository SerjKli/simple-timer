import 'package:flutter/material.dart';
import 'package:simpletimer/utils/enums/ColorTypes.dart';
import 'package:simpletimer/widgets/app_button.dart';
import 'package:simpletimer/widgets/app_text.dart';

class ClearStatisticDialog extends StatelessWidget {
  const ClearStatisticDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const AppText("Clear statistic"),
      content: const AppText(
          "You can't revert this operation! You will loose all statistic data, FOREVER! Please, don't do it"),
      actionsAlignment: MainAxisAlignment.center,
      actions: <Widget>[
        AppButton.regular(
          title: "Whatever, remove all",
          colorType: ColorTypes.error,
          onTap: () {
            Navigator.of(context).pop(true);
          },
        ),
        AppButton.regular(
          title: "Cancel",
          onTap: () {
            Navigator.of(context).pop(false);
          },
        ),
      ],
    );
  }
}
