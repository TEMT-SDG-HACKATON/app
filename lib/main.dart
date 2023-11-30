import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sdg_hackaton_app/app/app.bottomsheets.dart';
import 'package:sdg_hackaton_app/app/app.dialogs.dart';
import 'package:sdg_hackaton_app/app/app.locator.dart';
import 'package:sdg_hackaton_app/app/app.router.dart';
import 'package:sdg_hackaton_app/utilities/constants/strings.dart';
import 'package:sdg_hackaton_app/utilities/constants/themes.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: appNameString,
            theme: lightTheme,
            initialRoute: Routes.splashView,
            onGenerateRoute: StackedRouter().onGenerateRoute,
            navigatorKey: StackedService.navigatorKey,
            navigatorObservers: [
              StackedService.routeObserver,
            ],
          );
        });
  }
}
