import 'dart:developer';

import 'package:driverapp/Services/sharedprefrence.dart';
import 'package:driverapp/constant/app_colors.dart';
import 'package:driverapp/controller/auth_controller.dart';
import 'package:driverapp/controller/order_controller.dart';
import 'package:driverapp/notificationService/local_notification.dart';
import 'package:driverapp/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
 
import 'firebase_options.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
  LocalNotificationService.createanddisplaynotification(message);
}

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await SharedPrefService.init();
  // Setup Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: true,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission of notification');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission of notification');
  } else {
    print('User declined or has not accepted permission of notification');
  }
  log("fcmToken----     ${await FirebaseMessaging.instance.getToken()}");
  final fcmToken = await FirebaseMessaging.instance.getToken();
  log("fcmToken----    " + fcmToken.toString());

  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationService.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // intialize the Auth Provider here
        ChangeNotifierProvider(create: (_) => AuthController()),
        // initalize the order Controlle r
        ChangeNotifierProvider(create: (_) => OrderController())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Yaa Foods Driver',
        theme: ThemeData(
          primaryColor: AppColors.darkblueColor,
          scaffoldBackgroundColor: AppColors.whiteColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.whiteColor,
            iconTheme: IconThemeData(
              color: AppColors.whiteColor,
            ),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
