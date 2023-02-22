import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simpletimer/modules/edit_timer/blocs/timer/timer_bloc.dart';
import 'package:simpletimer/modules/main_screen/blocs/timer_list/timer_list_bloc.dart';
import 'package:simpletimer/modules/main_screen/ui/main_screen.dart';
import 'package:simpletimer/modules/play/blocs/active_timer/active_timer_bloc.dart';
import 'package:simpletimer/modules/settings/blocks/settings/exports.dart';
import 'package:simpletimer/route/NavigationService.dart';
import 'package:simpletimer/route/routes.dart';
import 'package:simpletimer/utils/services/LocatorService.dart';
import 'package:simpletimer/utils/theme/ThemeService.dart';

void main() async {
  await init();

  runApp(const MyApp());
}

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
}

//TODO: rename package name

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final lightTheme = ThemeService(themeMode: ThemeData.light()).themeData;
    final darkTheme = ThemeService(themeMode: ThemeData.dark()).themeData;

    /// GestureDetector is for hiding keyboard when we click outside of input fields
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => TimerListBloc()),
          BlocProvider(create: (context) => TimerBloc()),
          BlocProvider(create: (context) => ActiveTimerBloc()),
          BlocProvider(create: (context) => SettingsBloc()),
        ],
        child: MaterialApp(
          /// Global key for SnackBar messages
          scaffoldMessengerKey: locator<NavigationService>().scaffoldKey,

          title: 'SimpleTimer',

          /// Hide debug banner
          debugShowCheckedModeBanner: false,

          /// Theme data
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.light,

          /// Route settings
          navigatorKey: locator<NavigationService>().navigatorKey,
          onGenerateRoute: AppRouter.onGenerateRoute,

          home: const MainScreen(),
        ),
      ),
    );
  }
}
