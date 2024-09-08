import 'package:driverapp/custom_widget.dart/custom_button.dart';
import 'package:driverapp/views/Auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:driverapp/constant/app_img.dart';
import 'package:driverapp/constant/app_textStyle.dart';
import 'package:driverapp/controller/auth_controller.dart';
import 'package:page_transition/page_transition.dart';
 

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    AuthController controller =
        Provider.of<AuthController>(context, listen: true);
    return Scaffold(
        body: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: height * .2),
          child: Center(child: Image.asset(AppImages.locationLogo)),
        ),
        Padding(
          padding: EdgeInsets.only(top: width * .04),
          child: Text("Enable Your Location",
              style: urbanistSemiBold.copyWith(fontSize: width * .08)),
        ),
        Padding(
          padding: EdgeInsets.only(top: width * .04),
          child: Text("Enable your location to get the Trips Request .",
              textAlign: TextAlign.center,
              style: urbanistregular.copyWith(fontSize: width * .05)),
        ),
        Container(
          margin: EdgeInsets.only(
              left: width * .14, right: width * .14, top: width * .14),
          child: CustomButton(
            onTap: () {
              controller.determinePosition();
              controller.getCurrentLocation();
              Navigator.pushAndRemoveUntil(
                  context,
                  PageTransition(
                      duration: const Duration(milliseconds: 300),
                      reverseDuration: const Duration(milliseconds: 300),
                      type: PageTransitionType.rightToLeft,
                      child: const LoginScreen()),
                  (route) => false);
            },
            radius: width * .04,
            btnText: "USE MY LOCATION",
            fontSize: width * .05,
          ),
        )
      ],
    ));
  }
}
