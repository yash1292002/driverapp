// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:driverapp/views/Auth/login_screen.dart';
import 'package:driverapp/views/order/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:driverapp/Services/sharedprefrence.dart';
import 'package:driverapp/constant/app_colors.dart';
import 'package:driverapp/constant/app_img.dart';
import 'package:driverapp/constant/app_textStyle.dart';
import 'package:driverapp/controller/auth_controller.dart';

class NavigationDrawerPage extends StatelessWidget {
  const NavigationDrawerPage({super.key});

  @override
  Widget build(BuildContext context) => Container(
        child: Drawer(
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                buildHeader(context),
                buildMenuItems(context),
              ])),
        ),
      );

  Widget buildHeader(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    AuthController _controller =
        Provider.of<AuthController>(context, listen: true);
    return Container(
      color: AppColors.darkblueColor,
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top, left: width * .04),
      child: Column(children: [
        Row(children: [
          Padding(
              padding: EdgeInsets.only(left: width * .04, top: width * .04),
              child: CircleAvatar(
                  radius: 35.0,
                  backgroundColor: const Color(0xFF778899),
                  child: Image.asset(AppImages.ovelImg))),
          SizedBox(width: width * .04),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    _controller.getUserDataInfo != null
                        ? _controller.getUserDataInfo!.name.toString()
                        : "",
                    style: urbanistSemiBold.copyWith(
                        color: AppColors.whiteColor, fontSize: width * .05)),
                Container(
                  height: height * .025,
                  width: width * .3,
                  margin: EdgeInsets.only(top: width * .015),
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.amber,
                            blurRadius: 5.0,
                            spreadRadius: 1.5,
                            offset: Offset(1.0, 1))
                      ],
                      borderRadius: BorderRadius.circular(width * .04)),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.starImg),
                        Text("Level 2",
                            style: urbanistSemiBold.copyWith(
                                color: AppColors.darkblueColor,
                                fontSize: width * .035))
                      ]),
                ),
              ])
        ]),
        SizedBox(height: height * .02),
        // Container(
        //   width: width,
        //   height: height * .1,
        //   child: ListView.separated(
        //       padding: EdgeInsets.zero,
        //       scrollDirection: Axis.horizontal,
        //       itemBuilder: (context, index) {
        //         return Column(
        //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //           children: [
        //             Image.asset(
        //               data[index]['img'],
        //               width: width * .06,
        //             ),
        //             Text(data[index]['title'],
        //                 textAlign: TextAlign.center,
        //                 style: urbanistMedium.copyWith(
        //                     color: AppColors.whiteColor,
        //                     fontSize: width * .04)),
        //             Text(data[index]['subTitle'],
        //                 textAlign: TextAlign.center,
        //                 style: urbanistMedium.copyWith(
        //                     color: AppColors.whiteColor,
        //                     fontSize: width * .04))
        //           ],
        //         );
        //       },
        //       separatorBuilder: (context, index) {
        //         return Container(
        //           width: width * .07,
        //         );
        //       },
        //       itemCount: data.length),
        // ),
        SizedBox(height: height * .02)
      ]),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(25),
      child: Wrap(runSpacing: 16, children: [
        ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  PageTransition(
                      duration: const Duration(milliseconds: 300),
                      reverseDuration: const Duration(milliseconds: 300),
                      type: PageTransitionType.rightToLeft,
                      child: const OrderScreen()));
            },
            leading: Image.asset(AppImages.homeImg, width: width * .08),
            title: Text("Home",
                style: urbanistregular.copyWith(
                    color: AppColors.blackColor, fontSize: width * .045))),
        // ListTile(
        //   leading: Image.asset(
        //     AppImages.myWalletImg,
        //     width: width * .08,
        //   ),
        //   onTap: () {
        //     Navigator.push(
        //       context,
        //       PageTransition(
        //         duration: const Duration(milliseconds: 300),
        //         reverseDuration: const Duration(milliseconds: 300),
        //         type: PageTransitionType.rightToLeft,
        //         child: const MyWalletScreen(),
        //       ),
        //     );
        //   },
        //   title: Text(
        //     "My Wallet",
        //     style: urbanistregular.copyWith(
        //         color: AppColors.blackColor, fontSize: width * .045),
        //   ),
        // ),
        // ListTile(
        //   leading: Image.asset(
        //     AppImages.history,
        //     width: width * .08,
        //   ),
        //   onTap: () {
        //     Navigator.push(
        //       context,
        //       PageTransition(
        //         duration: const Duration(milliseconds: 300),
        //         reverseDuration: const Duration(milliseconds: 300),
        //         type: PageTransitionType.rightToLeft,
        //         child: const HistoryScreen(),
        //       ),
        //     );
        //   },
        //   title: Text(
        //     "History",
        //     style: urbanistregular.copyWith(
        //         color: AppColors.blackColor, fontSize: width * .045),
        //   ),
        // ),
        // ListTile(
        //   onTap: () {
        //     Navigator.pop(context);
        //     Navigator.push(
        //       context,
        //       PageTransition(
        //         duration: const Duration(milliseconds: 300),
        //         reverseDuration: const Duration(milliseconds: 300),
        //         type: PageTransitionType.rightToLeft,
        //         child: const NotificationScreen(),
        //       ),
        //     );
        //   },
        //   leading: Image.asset(
        //     AppImages.notification,
        //     width: width * .08,
        //   ),
        //   title: Text(
        //     "Notification",
        //     style: urbanistregular.copyWith(
        //         color: AppColors.blackColor, fontSize: width * .045),
        //   ),
        // ),
        GestureDetector(
          onTap: () {
            SharedPrefService().logout();
            Navigator.pushAndRemoveUntil(
                context,
                PageTransition(
                    duration: const Duration(milliseconds: 300),
                    reverseDuration: const Duration(milliseconds: 300),
                    type: PageTransitionType.rightToLeft,
                    child: const LoginScreen()),
                (route) => false);
          },
          child: ListTile(
              leading: Image.asset(AppImages.logOutImg, width: width * .08),
              title: Text("Log Out",
                  style: urbanistregular.copyWith(
                      color: AppColors.blackColor, fontSize: width * .045))),
        )
      ]),
    );
  }
}
