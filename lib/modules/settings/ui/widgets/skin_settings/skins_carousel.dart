import 'package:flutter/material.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';
import 'package:simpletimer/widgets/watch_skins/basic_skin/basic_skin.dart';
import 'package:simpletimer/widgets/watch_skins/digital_base_skin/digital_base_skin.dart';

import '../templates/setting_item.dart';
import 'skin_item.dart';

class SkinsCarousel extends SettingItem {
  const SkinsCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      padding: const EdgeInsets.only(top: UiValues.padding2x),
      child: PageView(
        controller: PageController(
          initialPage: 0,
          viewportFraction: 0.9,
        ),
        children: const [
          SkinItem(
            child: BasicSkin(
              isActive: true,
            ),
          ),
          SkinItem(
            child: DigitalBaseSkin(
              isActive: true,
            ),
          ),
        ],
      ),
    );
  }
}
