import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simpletimer/modules/edit_timer/blocs/timer/timer_bloc.dart';
import 'package:simpletimer/modules/main_screen/blocs/timer_list/timer_list_bloc.dart';
import 'package:simpletimer/modules/main_screen/ui/main_screen.dart';
import 'package:simpletimer/modules/play/blocs/active_timer/active_timer_bloc.dart';
import 'package:simpletimer/modules/settings/blocks/settings/exports.dart';
import 'package:simpletimer/modules/statistic/blocks/statistic/exports.dart';
import 'package:simpletimer/repositories/active_timer_repository.dart';
import 'package:simpletimer/route/NavigationService.dart';
import 'package:simpletimer/route/routes.dart';
import 'package:simpletimer/utils/services/LocatorService.dart';
import 'package:simpletimer/utils/services/audio_services/AudioServiceContract.dart';
import 'package:simpletimer/utils/theme/ThemeService.dart';

//TODO: ? iphone's dynamic island
//TODO: ? notification
//TODO: ? allow user keep alive active timer's screen
//TODO: ? app's widget with statistic?
//TODO: ? timer's reminder

void main() async {
  await init();

  runApp(const MyApp());
}

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Setup app's dependencies
  setupLocator();

  /// Create storage for hydrated bloc
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  /// Set preferred orientations
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  /// Audio service initialization
  final audioService = locator<AudioServiceContract>();
  if (audioService.initializationRequired) audioService.init();
}

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
          BlocProvider(
            create: (context) => SettingsBloc(
              audioService: locator<AudioServiceContract>(),
            ),
          ),
          BlocProvider(create: (context) => TimerListBloc()),
          BlocProvider(create: (context) => TimerBloc()),
          BlocProvider(
            create: (context) => StatisticBloc(
              locator<ActiveTimerRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => ActiveTimerBloc(
              audioService: locator<AudioServiceContract>(),
              activeTimerRepository: locator<ActiveTimerRepository>(),
            ),
          ),
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
