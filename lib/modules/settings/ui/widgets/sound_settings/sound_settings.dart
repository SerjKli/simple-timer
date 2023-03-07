import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/modules/settings/ui/widgets/sound_settings/choose_sound_dialog.dart';
import 'package:simpletimer/widgets/app_gap.dart';
import 'package:simpletimer/widgets/app_icon.dart';
import 'package:simpletimer/widgets/app_switch.dart';
import 'package:simpletimer/widgets/app_text.dart';

import '../../../blocks/settings/exports.dart';
import '../templates/setting_group.dart';
import '../templates/simple_setting_item.dart';
import 'volume_setting/volume_setting.dart';

class SoundSettings extends StatelessWidget {
  const SoundSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return SettingGroup(
          title: 'Sound',
          items: [
            SimpleSettingItem(
              title: "Play sound on last 3 seconds of the timer",
              trailer: AppSwitch(
                value: state.playSoundOnLastThreeSeconds,
                onChanged: (value) {
                  const event = ChangePlaySoundSettingEvent();
                  context.read<SettingsBloc>().add(event);
                },
              ),
            ),
            SimpleSettingItem(
              isActive: state.playSoundOnLastThreeSeconds,
              title: "Track",
              trailer: InkWell(
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const ChooseSoundDialog();
                    },
                  );
                },
                child: Row(
                  children: [
                    AppText(state.soundName),
                    const AppGap.horizontal(),
                    const AppIcon(icon: FontAwesomeIcons.caretDown),
                  ],
                ),
              ),
            ),
            const VolumeSetting(),
          ],
        );
      },
    );
  }
}
