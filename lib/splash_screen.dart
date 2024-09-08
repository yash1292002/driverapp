import 'dart:async';
import 'dart:developer';

import 'package:driverapp/Services/sharedprefrence.dart';
import 'package:driverapp/constant/app_colors.dart';
import 'package:driverapp/constant/app_img.dart';
import 'package:driverapp/controller/auth_controller.dart';
import 'package:driverapp/notificationService/local_notification.dart';
import 'package:driverapp/views/onboarding_screen/onboarding_screen.dart';
import 'package:driverapp/views/order/order_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
 
import 'package:loading_animation_widget/loading_animation_widget.dart';
 


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? token = SharedPrefService().getToken();
  String? online = SharedPrefService().getOnline();

  @override
  void initState() {
    super.initState();
    AuthController _controller =
        Provider.of<AuthController>(context, listen: false);
    Timer(const Duration(seconds: 3), () {
      log("--------------  " + token.toString());
      // 1. This method call when app in terminated state and you get a notification
      // when you click on notification app open from terminated state and you can get notification data in this method
      FirebaseMessaging.instance.getInitialMessage().then(
        (message) {
          print("FirebaseMessaging.instance.getInitialMessage");
          if (message != null) {
            print("New Notification");
            // if (message.data['_id'] != null) {
            //   Navigator.of(context).push(
            //     MaterialPageRoute(
            //       builder: (context) => DemoScreen(
            //         id: message.data['_id'],
            //       ),
            //     ),
            //   );
            // }
          }
        },
      );

      // 2. This method only call when App in forground it mean app must be opened
      FirebaseMessaging.onMessage.listen(
        (message) {
          print("FirebaseMessaging.onMessage.listen");
          if (message.notification != null) {
            print(message.notification!.title);
            print(message.notification!.body);
            print("message.data11 ${message.data}");
            LocalNotificationService.createanddisplaynotification(message);
          }
        },
      );

      // 3. This method only call when App in background and not terminated(not closed)
      FirebaseMessaging.onMessageOpenedApp.listen(
        (message) {
          print("FirebaseMessaging.onMessageOpenedApp.listen");
          if (message.notification != null) {
            print(message.notification!.title);
            print(message.notification!.body);
            print("message.data22 ${message.data['_id']}");
            // LocalNotificationService.createanddisplaynotification(message);
          }
        },
      );

      if (token == null) {
        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
                duration: const Duration(milliseconds: 300),
                reverseDuration: const Duration(milliseconds: 300),
                type: PageTransitionType.rightToLeft,
                child: const OnBoardingScreen()),
            (route) => false);
        // if (online == "online") {
        //   _controller.setConsent1(true);
        //   Navigator.pushAndRemoveUntil(
        //       context,
        //       PageTransition(
        //           duration: const Duration(milliseconds: 300),
        //           reverseDuration: const Duration(milliseconds: 300),
        //           type: PageTransitionType.rightToLeft,
        //           child: const OrderScreen()),
        //       (route) => false);
        // } else {
        //   _controller.setConsent1(false);
        //   Navigator.pushAndRemoveUntil(
        //       context,
        //       PageTransition(
        //           duration: const Duration(milliseconds: 300),
        //           reverseDuration: const Duration(milliseconds: 300),
        //           type: PageTransitionType.rightToLeft,
        //           child: const OrderScreen()),
        //       (route) => false);
        // }
      } else {
        _controller.refreshToken(context).then((value) {
          if (online == "online") {
            _controller.setConsent1(true);
            _controller.getdriverProfiles().then((value) {
              Navigator.push(
                context,
                PageTransition(
                    duration: const Duration(milliseconds: 300),
                    reverseDuration: const Duration(milliseconds: 300),
                    type: PageTransitionType.rightToLeft,
                    child: const OrderScreen()),
              );
            });
          } else {
            _controller.getdriverProfiles().then((value) {
              Navigator.push(
                context,
                PageTransition(
                    duration: const Duration(milliseconds: 300),
                    reverseDuration: const Duration(milliseconds: 300),
                    type: PageTransitionType.rightToLeft,
                    child: const OrderScreen()),
              );
            });
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: AppColors.darkblueColor,
        body: Container(
          height: height,
          decoration: const BoxDecoration(color: AppColors.darkblueColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  AppImages.splashLogo,
                  width: width * .25,
                  height: height * .35,
                ),
              ),
              Center(
                child: Container(
                  margin:
                      EdgeInsets.only(top: width * .25, bottom: width * .02),
                  child: LoadingAnimationWidget.hexagonDots(
                      color: AppColors.whiteColor, size: width * .08),
                ),
              )
            ],
          ),
        ));
  }
}
