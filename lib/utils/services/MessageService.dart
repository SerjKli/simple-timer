import 'package:flutter/material.dart';
import 'package:simpletimer/route/NavigationService.dart';
import 'package:simpletimer/utils/services/LocatorService.dart';
import 'package:simpletimer/utils/theme/extensions/context.dart';

import '../theme/ui_values.dart';

enum MessageType {
  success,
  error,
}

class MessageService {
  static SnackBarAction getAction(String? actionTitle, Function? actionCallback) {
    BuildContext context = locator<NavigationService>().navigatorKey.currentContext!;

    return SnackBarAction(
      textColor: context.colorScheme.light,
      label: actionTitle ?? 'Ok',
      onPressed: () {
        if (actionCallback != null) {
          actionCallback();
        } else {
          locator<NavigationService>().scaffoldKey.currentState!.hideCurrentSnackBar();
        }
      },
    );
  }

  static showMessage(
    String text,
    MessageType type, {
    String? actionTitle,
    Function? actionCallback,
  }) {
    assert(actionTitle != null ? actionCallback != null : true);

    final state = locator<NavigationService>().scaffoldKey;
    final BuildContext context = locator<NavigationService>().navigatorKey.currentContext!;

    final Color bg =
        type == MessageType.error ? context.colorScheme.error! : context.colorScheme.success!;

    state.currentState?.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: bg,
        margin: const EdgeInsets.only(
          bottom: UiValues.buttonHeight + UiValues.padding2x,
          left: UiValues.padding2x,
          right: UiValues.padding2x,
        ),
        content: Text(text),
        action: getAction(actionTitle, actionCallback),
      ),
    );
  }

  static success(String text) {
    MessageService.showMessage(text, MessageType.success);
  }

  static error(String text) {
    MessageService.showMessage(text, MessageType.error);
  }
}
