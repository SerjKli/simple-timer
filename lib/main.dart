import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simpletimer/modules/main_screen/blocs/timer_list/timer_list_bloc.dart';
import 'package:simpletimer/modules/main_screen/ui/MainScreen.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final lightTheme = ThemeService(themeMode: ThemeData.light()).themeData;
    final darkTheme = ThemeService(themeMode: ThemeData.dark()).themeData;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TimerListBloc()),
      ],
      child: MaterialApp(
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
    );
  }
}
