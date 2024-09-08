// ignore_for_file: no_leading_underscores_for_local_identifiers, sized_box_for_whitespace

import 'dart:async';
import 'package:driverapp/controller/order_controller.dart';
import 'package:driverapp/views/Home_screen/drawer.dart';
import 'package:driverapp/views/order/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:driverapp/constant/app_colors.dart';
import 'package:driverapp/constant/app_textStyle.dart';
import 'package:driverapp/controller/auth_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
 

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    AuthController controller =
        Provider.of<AuthController>(context, listen: false);
    controller.getdriverProfiles().then((value) => {
          controller.determinePosition().then((value1) {
            controller.getCurrentLocation().then((value2) {
              setState(() {
                isLoading = false;
              });
              // mapBottomSheet();
            });
            controller.setFcmToken();
          }),
        });
    timer = Timer.periodic(Duration(seconds: 30), (Timer t) {
      controller.determinePosition().then((value1) {
        controller.getCurrentLocation().then((value2) {
          print("--------------------------------+${value2}");
          //  if (value2!= null) {
          controller.UpdateLocation();

          //  }
        });
      });
    });
    // print(timer.toString());
    // timer = Timer.periodic(Duration(seconds: 30), (Timer t) => controller.UpdateLocation());
  }

  GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    AuthController controller =
        Provider.of<AuthController>(context, listen: true);
    OrderController _orderController =
        Provider.of<OrderController>(context, listen: true);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.darkblueColor),
        elevation: 0,
        title: Text(controller.isConsent == true ? "Online" : "Offline",
            style: urbanistSemiBold.copyWith(color: AppColors.blackColor)),
        actions: [
          Container(
            padding: EdgeInsets.only(right: width * .03),
            child: FlutterSwitch(
              width: width * .1,
              height: width * .05,
              toggleSize: width * .04,
              value: controller.isConsent!,
              activeToggleColor: AppColors.lightGreen,
              inactiveToggleColor: AppColors.redColor,
              borderRadius: width * .03,
              activeColor: AppColors.whiteColor,
              inactiveColor: AppColors.whiteColor,
              padding: width * .006,
              activeSwitchBorder:
                  Border.all(color: AppColors.lightGreen, width: 0.8),
              inactiveSwitchBorder:
                  Border.all(color: AppColors.redColor, width: 0.8),
              onToggle: (val) {
                controller.setConsent(val);

                if (val == true) {
                  _orderController.changeDriverStatus(1);
                  Timer(const Duration(seconds: 1), () {
                    Navigator.push(
                        context,
                        PageTransition(
                            duration: const Duration(milliseconds: 300),
                            reverseDuration: const Duration(milliseconds: 300),
                            type: PageTransitionType.rightToLeft,
                            child: const OrderScreen()));
                  });
                } else if (val == false) {
                  // Timer(const Duration(seconds: 1), () {
                  //   Navigator.push(
                  //       context,
                  //       PageTransition(
                  //           duration: const Duration(milliseconds: 300),
                  //           reverseDuration: const Duration(milliseconds: 300),
                  //           type: PageTransitionType.rightToLeft,
                  //           child: const HomeScreen()));
                  // });
                  Navigator.push(
                      context,
                      PageTransition(
                          duration: const Duration(milliseconds: 300),
                          reverseDuration: const Duration(milliseconds: 300),
                          type: PageTransitionType.rightToLeft,
                          child: const OrderScreen()));
                }
              },
            ),
          ),
        ],
      ),
      drawer: const NavigationDrawerPage(),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(color: AppColors.darkblueColor))
          : Container(
              height: height,
              width: width,
              child: Column(
                children: [
                  Container(
                    height: height * .08,
                    width: width,
                    padding: EdgeInsets.only(left: width * .04),
                    color: controller.isConsent == true
                        ? AppColors.darkblueColor
                        : AppColors.redColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.isConsent == true
                              ? "Hi ${controller.getUserDataInfo?.name} ,  You are online !"
                              : "Hi ${controller.getUserDataInfo?.name} ,  You are offline !",
                          style: urbanistSemiBold.copyWith(
                              fontSize: width * .05,
                              color: AppColors.whiteColor),
                        ),
                        Text(
                          controller.isConsent == true
                              ? "You will receive a new Trip Request Shortly"
                              : "Go online to start accepting jobs.",
                          style: urbanistregular.copyWith(
                              fontSize: width * .045,
                              color: AppColors.whiteColor),
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: height * .8,
                          width: width,
                          child: GoogleMap(
                            mapType: MapType.normal,
                            initialCameraPosition: controller.kLake!,
                            zoomControlsEnabled: true,
                            indoorViewEnabled: true,
                            buildingsEnabled: false,
                            myLocationEnabled: true,
                            compassEnabled: true,
                            myLocationButtonEnabled: true,
                            rotateGesturesEnabled: true,
                            markers: controller.markers,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
    );
  }

  // void mapBottomSheet() {
  //   double width = MediaQuery.of(context).size.width;
  //   double height = MediaQuery.of(context).size.height;
  //   showModalBottomSheet(
  //       context: context,
  //       // isDismissible: false,
  //       enableDrag: false,
  //       barrierColor: Colors.transparent,
  //       backgroundColor: AppColors.whiteColor,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(width * .1),
  //           topRight: Radius.circular(width * .1),
  //         ),
  //       ),
  //       isScrollControlled: true,
  //       builder: (ctx) {
  //         return Container(
  //             height: height * .35,
  //             margin: EdgeInsets.only(
  //               top: height * .01,
  //             ),
  //             child: const MapBottomSheet());
  //       });
  // }
}
