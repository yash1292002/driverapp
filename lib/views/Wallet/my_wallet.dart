import 'package:driverapp/constant/app_const.dart';
import 'package:flutter/material.dart';
import 'package:driverapp/constant/app_colors.dart';
import 'package:driverapp/constant/app_img.dart';
import 'package:driverapp/constant/app_textStyle.dart';

class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({super.key});

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.width;
    double width = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.darkgreyColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.darkblueColor,
        automaticallyImplyLeading: true,
        title: const Text("My Wallet"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * .6,
              width: width,
              color: AppColors.darkblueColor,
              child: Column(
                children: [
                  Text("3000 SAR",
                      style: urbanistBold.copyWith(
                          color: AppColors.whiteColor, fontSize: width * .05)),
                  Text(
                    "Total earn",
                    style: urbanistregular.copyWith(
                        color: AppColors.whiteColor, fontSize: width * .02),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(right: width * .02, left: width * .02),
                    margin: EdgeInsets.only(
                        left: width * .02,
                        right: width * .02,
                        top: width * .02),
                    height: height * .23,
                    width: width,
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(width * .02)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.paymentIcon),
                        Text("Withdraw Payment",
                            style: urbanistSemiBold.copyWith(
                                color: AppColors.blackColor,
                                fontSize: width * .025)),
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.greyColor,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: width * .03, top: width * .01),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment history",
                    style: urbanistBold.copyWith(
                        color: AppColors.blackColor, fontSize: width * .02),
                  ),
                  Container(
                    height: height,
                    width: width,
                    margin:
                        EdgeInsets.only(right: width * .04, top: width * .02),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        border: Border.all(color: AppColors.greyColor),
                        borderRadius: BorderRadius.circular(width * .02)),
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Container(
                            // height: height * .5,
                            // width: width,
                            // decoration: BoxDecoration(
                            //     color: AppColors.whiteColor,
                            //     border: Border.all(color: AppColors.blackColor),
                            //     borderRadius: BorderRadius.circular(width * .03)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(paymentData[index]['title'],
                                        style: urbanistMedium.copyWith(
                                            color: AppColors.blackColor,
                                            fontSize: width * .02)),
                                    Text(paymentData[index]['amount'],
                                        style: urbanistMedium.copyWith(
                                            color: AppColors.blackColor,
                                            fontSize: width * .02))
                                  ],
                                ),
                                Text(paymentData[index]['subTitle'],
                                    style: urbanistMedium.copyWith(
                                        color: AppColors.greyColor,
                                        fontSize: width * .02)),
                                const Divider()
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Container();
                        },
                        itemCount: paymentData.length),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
