import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/utils/extensions/beatify.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';
import 'package:simpletimer/widgets/app_icon_button.dart';
import 'package:simpletimer/widgets/app_text.dart';

import '../../../../blocks/settings/exports.dart';
import 'active_volume_dialog.dart';
import 'volume_slider.dart';
import 'volume_slider_wrapper.dart';

class VolumeActionButton extends StatelessWidget {
  const VolumeActionButton({Key? key}) : super(key: key);

  double _calculateTopOffset(GlobalKey key) {
    final RenderBox renderBox =
        key.currentContext?.findRenderObject() as RenderBox;
    return renderBox.localToGlobal(Offset.zero).dy;
  }

  void _showActivateSoundDialog(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return const ActiveVolumeDialog();
      },
    );

    if (result == true) {
      const event = ChangePlaySoundSettingEvent();
      context.read<SettingsBloc>().add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    final buttonKey = GlobalKey();

    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        if (!state.playSoundOnLastThreeSeconds) {
          return AppIconButton(
            onPressed: () => _showActivateSoundDialog(context),
            icon: FontAwesomeIcons.volumeXmark,
          );
        }

        return Badge(
          label: AppText("${(state.volume).floor()}"),
          alignment: AlignmentDirectional.bottomEnd,
          backgroundColor: Colors.transparent,
          child: AppIconButton(
            key: buttonKey,
            onPressed: () {
              showGeneralDialog(
                context: context,
                pageBuilder: (
                  BuildContext buildContext,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                ) {
                  return Wrap(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerRight,
                        child: VolumeSliderWrapper(
                          _calculateTopOffset(buttonKey),

                          /// Slider required any Material widget, such as Card, Scaffold, Dialog
                          child: const Card(child: VolumeSlider()),
                        ),
                      ),
                    ],
                  );
                },
                barrierDismissible: true,
                barrierColor: Colors.transparent,
                barrierLabel:
                    MaterialLocalizations.of(context).modalBarrierDismissLabel,
                transitionDuration:
                    UiValues.animationSpeed.toMillisecondsDuration,
              );
            },
            icon: FontAwesomeIcons.volumeHigh,
          ),
        );
      },
    );
  }
}
