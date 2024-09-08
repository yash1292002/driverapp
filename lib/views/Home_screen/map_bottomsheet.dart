// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:driverapp/constant/app_colors.dart';
import 'package:driverapp/constant/app_img.dart';
import 'package:driverapp/constant/app_textStyle.dart';
import 'package:driverapp/controller/auth_controller.dart';

import '../../constant/app_const.dart';

class MapBottomSheet extends StatefulWidget {
  const MapBottomSheet({super.key});

  @override
  State<MapBottomSheet> createState() => _MapBottomSheetState();
}

class _MapBottomSheetState extends State<MapBottomSheet> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    AuthController _controller =
        Provider.of<AuthController>(context, listen: true);
    return Container(
      margin: EdgeInsets.only(left: width * .04, right: width * .04),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: width * .03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  AppImages.ovelImg,
                  height: height * .08,
                  width: width * .08,
                ),
                Container(
                  margin: EdgeInsets.only(left: width * .02),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _controller.getUserDataInfo!.name.toString(),
                        style: urbanistBold.copyWith(
                            fontSize: width * .03, color: AppColors.blackColor),
                      ),
                      Text(
                        "LEVEL 2 ",
                        style: urbanistMedium.copyWith(
                            fontSize: width * .023,
                            color: AppColors.blackColor),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: width * .02),
            padding: EdgeInsets.only(left: width * .02),
            height: height * .15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: AppColors.darkblueColor,
            ),
            child: Container(
              width: width * .9,
              height: height * .1,
              child: ListView.separated(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          data[index]['img'],
                          width: width * .05,
                        ),
                        Text(data[index]['title'],
                            textAlign: TextAlign.center,
                            style: urbanistMedium.copyWith(
                                color: AppColors.whiteColor,
                                fontSize: width * .02)),
                        Text(data[index]['subTitle'],
                            textAlign: TextAlign.center,
                            style: urbanistMedium.copyWith(
                                color: AppColors.whiteColor,
                                fontSize: width * .02))
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      width: width * .03,
                    );
                  },
                  itemCount: data.length),
            ),
          ),
          // Container(
          //   margin: EdgeInsets.only(
          //       left: width * .08, right: width * .08, top: width * .04),
          //   height: height * .008,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(30.0),
          //     color: AppColors.blackColor,
          //   ),
          // ),
        ],
      ),
    );
  }
}
