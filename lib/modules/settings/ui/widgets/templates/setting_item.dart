import 'package:flutter/material.dart';
import 'package:simpletimer/utils/enums/ColorTypes.dart';
import 'package:simpletimer/widgets/app_text.dart';

//TODO: use inheritance
class SettingItem extends StatelessWidget {
  const SettingItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppText(
      "not implemented setting item",
      colorType: ColorTypes.error,
    );
  }
}
