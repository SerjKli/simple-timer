import 'package:flutter/material.dart';

import '../templates/setting_group.dart';
import 'skins_carousel.dart';

class SkinSettings extends StatelessWidget {
  const SkinSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SettingGroup(
      title: 'Skin',
      items: [
        SkinsCarousel(),
      ],
    );
  }
}
