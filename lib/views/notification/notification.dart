import 'package:driverapp/constant/app_const.dart';
import 'package:driverapp/views/Home_screen/drawer.dart';
import 'package:flutter/material.dart';
import 'package:driverapp/constant/app_colors.dart';
import 'package:driverapp/constant/app_textStyle.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.darkgreyColor,
      appBar: AppBar(
        // automaticallyImplyLeading: true,
        elevation: 1,
        iconTheme: const IconThemeData(color: AppColors.darkblueColor),
        title: Text("Notification",
            style: urbanistSemiBold.copyWith(
              color: AppColors.blackColor,
            )),
        backgroundColor: AppColors.whiteColor,
      ),
      drawer: const NavigationDrawerPage(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: width * .04),
            height: height * .4,
            width: width,
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: AppColors.whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.darkgreyColor,
                          blurRadius: 5.0, // soften the shadow
                          spreadRadius: 1.5, //extend the shadow
                          offset: Offset(
                            1.0, // Move to right 10  horizontally
                            1, // Move to bottom 10 Vertically
                          ),
                        )
                      ],
                    ),
                    height: height * .1,
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(notificationData[index]['img']),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                notificationData[index]['title'],
                                style: urbanistBold.copyWith(
                                    color: AppColors.blackColor,
                                    fontSize: width * .044),
                              ),
                              Text(notificationData[index]['subTitle'],
                                  style: urbanistregular.copyWith(
                                      color: AppColors.blackColor,
                                      fontSize: width * .044))
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: height * .01,
                  );
                },
                itemCount: notificationData.length),
          )
        ],
      ),
    );
  }
}
