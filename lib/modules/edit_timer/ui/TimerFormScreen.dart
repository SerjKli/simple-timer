import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/widgets/app_button.dart';
import 'package:simpletimer/widgets/app_screen.dart';
import 'package:simpletimer/widgets/app_watch.dart';

class TimerFormScreen extends StatelessWidget {
  static const String routeName = '/timer-form';

  const TimerFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      isInSafeArea: false,
      screenTitle: "Timer's properties",
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const AppWatch(),
                const Spacer(),
                AppButton(
                  title: "Save",
                  icon: FontAwesomeIcons.check,
                  onTap: () {
                    debugPrint("ready to save");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
