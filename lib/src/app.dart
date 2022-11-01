import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:learning/src/auth/presentation/login.dart';
import 'package:learning/src/interactive/soil_page.dart';
import 'package:learning/src/main_map/presentation/farmer_map.dart';
import 'package:learning/src/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'sample_feature/sample_item_details_view.dart';
import 'sample_feature/sample_item_list_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String token = "";
  @override
  void initState() {
    super.initState();
    initial();
  }

  initial() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString("token") ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return AnimatedBuilder(
      animation: widget.settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          restorationScopeId: 'app',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
          ],
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,
          theme: ThemeData(fontFamily: "MyanUni"),
          // theme: ThemeData(),
          darkTheme: ThemeData.light(),
          themeMode: widget.settingsController.themeMode,
          //initialRoute: DownloadScreen.routeName,
          // initialRoute: //FarmerMapScreen.routeName,
          home: const SplashScreen(),
          // home: const Setting(),
          // initialRoute: ,
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: widget.settingsController);
                  case SampleItemDetailsView.routeName:
                    return const SampleItemDetailsView();
                  case SoilPageScreen.routeName:
                    return const SoilPageScreen();
                  case LoginScreen.routeName:
                    return const LoginScreen();
                  case FarmerMapScreen.routeName:
                    return FarmerMapScreen(fromModule: false);

                  case SampleItemListView.routeName:
                  default:
                    return FarmerMapScreen(fromModule: false);
                }
              },
            );
          },
        );
      },
    );
  }
}
