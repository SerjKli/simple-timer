import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/utils/assets/AudioAssets.dart';
import 'package:simpletimer/utils/services/LocatorService.dart';
import 'package:simpletimer/utils/services/audio_services/AudioServiceContract.dart';
import 'package:simpletimer/widgets/app_icon_button.dart';

class TestSoundButton extends StatelessWidget {
  const TestSoundButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      onPressed: () {

        const testSound = AudioAssets.test;
        locator<AudioServiceContract>().playFromAssets(testSound);

      },
      icon: FontAwesomeIcons.music,
    );
  }
}
