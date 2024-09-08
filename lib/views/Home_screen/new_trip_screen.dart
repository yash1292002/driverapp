// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:driverapp/constant/app_colors.dart';
import 'package:driverapp/constant/app_img.dart';
import 'package:driverapp/constant/app_textStyle.dart';
import 'package:driverapp/controller/auth_controller.dart';

import '../../custom_widget.dart/custom_button.dart';

class NewTripScreen extends StatefulWidget {
  const NewTripScreen({super.key});

  @override
  State<NewTripScreen> createState() => _NewTripScreenState();
}

class _NewTripScreenState extends State<NewTripScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    AuthController _controller =
        Provider.of<AuthController>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.darkblueColor,
        elevation: 0,
      ),
      backgroundColor: AppColors.darkblueColor,
      body: Column(
        children: [
          Center(
            child: Image.asset(
              AppImages.yaaFoodsLogo,
              height: height * .12,
              width: width * .5,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: width * .04, top: width * .025, right: width * .04),
            child: Text(
              "NEW TRIP REQUEST",
              textAlign: TextAlign.center,
              style: urbanistBold.copyWith(
                  fontSize: width * .075, color: AppColors.whiteColor),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: width * .05,
            ),
            height: height * .425,
            width: width * .9,
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(width * .04)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(left: width * .04, top: width * .04),
                      child: Text(
                        "No. 8900001",
                        style: urbanistSemiBold.copyWith(
                            fontSize: width * .05,
                            color: AppColors.lightBlackColor),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(right: width * .04, top: width * .04),
                      child: Text(
                        "2023-01-09, 12:13:08",
                        style: urbanistMedium.copyWith(
                            fontSize: width * .05,
                            color: AppColors.darkblueColor),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: width * .04, right: width * .04),
                  child: Divider(
                      color: AppColors.lightGreyColor, thickness: width * .004),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(left: width * .04, top: width * .02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "CUSTOMER",
                            style: urbanistBold.copyWith(
                                fontSize: width * .04,
                                color: AppColors.darkpurpal),
                          ),
                          Text(
                            "Farhal",
                            style: urbanistMedium.copyWith(
                                fontSize: width * .05,
                                color: AppColors.lightBlackColor),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(right: width * .04, top: width * .02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "ORDER PRICE",
                            style: urbanistBold.copyWith(
                                fontSize: width * .04,
                                color: AppColors.darkpurpal),
                          ),
                          Text(
                            "47.61 SR",
                            style: urbanistMedium.copyWith(
                                fontSize: width * .05,
                                color: AppColors.lightBlackColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: width * .04, right: width * .04),
                  child: Divider(
                      color: AppColors.lightGreyColor, thickness: width * .004),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(left: width * .04, top: width * .02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ADDRESS",
                            style: urbanistBold.copyWith(
                                fontSize: width * .04,
                                color: AppColors.darkpurpal),
                          ),
                          Text(
                            "Olaya Riyadh , Saudi Arabia",
                            style: urbanistMedium.copyWith(
                                fontSize: width * .05,
                                color: AppColors.lightBlackColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: width * .04, right: width * .04),
                  child: Divider(
                      color: AppColors.lightGreyColor, thickness: width * .004),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: width * .04, right: width * .04, top: width * .04),
                  child: CustomButton(
                    onTap: () {},
                    btnText: "ACCEPT",
                    btnColor: AppColors.darkblueColor,
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: width * .04, right: width * .04),
                  child: Divider(
                      color: AppColors.lightGreyColor, thickness: width * .004),
                ),
                Text(
                  "Cancel",
                  style: urbanistMedium.copyWith(
                      fontSize: width * .04, color: AppColors.darkpurpal),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
