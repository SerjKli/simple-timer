import 'package:flutter/material.dart';
import 'package:simpletimer/modules/settings/ui/widgets/sound_settings/sound_item.dart';
import 'package:simpletimer/route/NavigationService.dart';
import 'package:simpletimer/utils/enums/ColorTypes.dart';
import 'package:simpletimer/utils/services/LocatorService.dart';
import 'package:simpletimer/widgets/app_button.dart';
import 'package:simpletimer/widgets/dialogs/base_dialog.dart';
import 'package:simpletimer/widgets/nothing.dart';

import '../../../blocks/settings/exports.dart';

class ChooseSoundDialog extends StatelessWidget {
  const ChooseSoundDialog({Key? key}) : super(key: key);

  static const List<String> _sounds = [
    'base',
    'bell',
    'arcade',
    'race',
  ];

  _updateSoundFileNameSetting(BuildContext context, value) {
    if (value is! String) return;

    final event = ChangeSoundFileNameSettingEvent(value);
    context.read<SettingsBloc>().add(event);
  }

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: const Nothing(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ..._sounds
                .map(
                  (e) => SoundItem(
                    value: e,
                    onChanged: (value) {
                      _updateSoundFileNameSetting(context, value);
                    },
                  ),
                )
                .toList(),
          ],
        ),
      ),
      actions: [
        AppButton.regular(
          title: "Save",
          colorType: ColorTypes.brand,
          onTap: () {
            locator<NavigationService>().pop();
          },
        ),
      ],
    );
  }
}
