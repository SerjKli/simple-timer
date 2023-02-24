import 'package:flutter/material.dart';
import 'package:simpletimer/modules/settings/ui/widgets/skin_settings/skin_item.dart';
import 'package:simpletimer/widgets/watch_skins/basic_skin/basic_skin.dart';
import 'package:simpletimer/widgets/watch_skins/digital_base_skin/digital_base_skin.dart';

import '../../../blocks/settings/exports.dart';
import '../templates/setting_item.dart';

class SkinsCarousel extends SettingItem {
  static const double skinsWidgetHeightFactor = 0.3668;
  static const double carouselFraction = 0.66;

  static const List<String> skins = [
    BasicSkin.skinName,
    DigitalBaseSkin.skinName,
  ];

  const SkinsCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaSize = MediaQuery.of(context).size;

    return SizedBox(
      height: mediaSize.height * skinsWidgetHeightFactor,
      child: OverflowBox(
        maxWidth: MediaQuery.of(context).size.width,
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            final pageIndex = skins.indexOf(state.skinName);

            return PageView(
              controller: PageController(
                initialPage: pageIndex,
                viewportFraction: carouselFraction,
              ),
              onPageChanged: (int pageIndex) {
                final event = ChangeWatchSkinSettingEvent(skins[pageIndex]);
                context.read<SettingsBloc>().add(event);
              },
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
            );
          },
        ),
      ),
    );
  }
}
