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
            SoundItem(
                value: 'base',
                onChanged: (value) {
                  debugPrint("${value}"); //TODO: remove debugging
                  _updateSoundFileNameSetting(context, value);
                }),
            SoundItem(
                value: 'race',
                onChanged: (value) {
                  debugPrint("${value}"); //TODO: remove debugging
                  _updateSoundFileNameSetting(context, value);
                }),
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
