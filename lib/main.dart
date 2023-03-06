import 'package:disaster_management/src/features/authentication/screens/splash_Screen/splash_Screen.dart';
import 'package:disaster_management/src/features/reporting_and_mapping/location_controller.dart';
import 'package:disaster_management/src/features/reporting_and_mapping/location_search_dialogue.dart';
import 'package:disaster_management/src/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LocationController());
    return GetMaterialApp(
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: SplashScreen(),
      routes: {
        LocationSearchDialog.routeName: (context) => LocationSearchDialog(),
      },
    );
  }
}
