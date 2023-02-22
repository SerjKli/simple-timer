import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:simpletimer/widgets/app_text.dart';
import 'package:simpletimer/widgets/nothing.dart';
import 'package:url_launcher/url_launcher.dart';

import 'templates/setting_group.dart';
import 'templates/simple_setting_item.dart';

class AboutSettings extends StatelessWidget {
  const AboutSettings({Key? key}) : super(key: key);

  void _goToDeveloperWebsite() async {
    //TODO: insert correct web site
    final Uri url = Uri.parse("https://google.com");

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SettingGroup(
      title: 'About',
      items: [
        SimpleSettingItem(
          title: "Version",
          withTopPadding: true,
          trailer: FutureBuilder(
              future: PackageInfo.fromPlatform(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.data == null) return const Nothing();

                  return AppText(snapshot.data!.version);
                }

                return const Nothing();
              }),
        ),
        SimpleSettingItem(
          title: "Created by",
          trailer: GestureDetector(
            onTap: () => _goToDeveloperWebsite(),
            child: const AppText('SimpleAppsOk'),
          ),
        ),
      ],
    );
  }
}
