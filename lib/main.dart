import 'package:disaster_management/firebase_options.dart';
import 'package:disaster_management/src/features/authentication/screens/splash_Screen/splash_Screen.dart';
import 'package:disaster_management/src/features/reporting_and_mapping/Providers/marker_provider.dart';
import 'package:disaster_management/src/features/reporting_and_mapping/location_controller.dart';
import 'package:disaster_management/src/features/reporting_and_mapping/location_search_dialogue.dart';
import 'package:disaster_management/src/repository/authentication_repository/authentication_repository.dart';
import 'package:disaster_management/src/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Background handling message : ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  await FirebaseMessaging.instance.getInitialMessage();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LocationController());
    return ChangeNotifierProvider(
      create: (context) => MarkerProvider(),
      child: GetMaterialApp(
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
        home: SplashScreen(),
        routes: {
          LocationSearchDialog.routeName: (context) => LocationSearchDialog(),
        },
      ),
    );
  }
}
