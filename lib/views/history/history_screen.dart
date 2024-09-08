// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:driverapp/constant/app_const.dart';
import 'package:driverapp/views/order/pending__order/pending_order_details.dart';
import 'package:flutter/material.dart';

import 'package:driverapp/constant/app_colors.dart';
import 'package:driverapp/constant/app_textStyle.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
 

import '../Home_screen/drawer.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  DateTime _selectedValue = DateTime.now();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.darkgreyColor,
      appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColors.darkblueColor),
          elevation: 0,
          title: Text("History",
              style: urbanistSemiBold.copyWith(color: AppColors.blackColor))),
      drawer: NavigationDrawerPage(),
      body: Column(
        children: [
          Container(
            color: AppColors.whiteColor,
            height: height * .12,
            width: width,
            child: Column(
              children: [
                DatePicker(
                  DateTime.now(),
                  width: 60,
                  height: 80,
                  // controller: _controller,
                  initialSelectedDate: DateTime.now(),
                  dateTextStyle:
                      urbanistMedium.copyWith(fontSize: width * .045),

                  selectionColor: Colors.grey,
                  selectedTextColor: Colors.white,
                  inactiveDates: const [
                    // DateTime.now().add(Duration(days: 3)),
                    // DateTime.now().add(Duration(days: 4)),
                    // DateTime.now().add(Duration(days: 7))
                  ],
                  onDateChange: (date) {
                    // New date selected
                    setState(() {
                      _selectedValue = date;
                    });
                    print(_selectedValue.toString());
                  },
                ),
              ],
            ),
          ),
          Container(
            height: height * .08,
            width: width,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: width * .04),
                    width: width * .4,
                    decoration: BoxDecoration(
                        color: AppColors.darkblueColor,
                        borderRadius: BorderRadius.circular(width * .04)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          graphData[index]['img'],
                          width: width * .098,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              graphData[index]["title"],
                              style: urbanistMedium.copyWith(
                                  fontSize: width * .035,
                                  color: AppColors.whiteColor),
                            ),
                            Text(
                              graphData[index]["rs"],
                              style: urbanistBold.copyWith(
                                  fontSize: width * .04,
                                  color: AppColors.whiteColor),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    width: width * .04,
                  );
                },
                itemCount: graphData.length),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: width * .04),
                height: height,
                width: width,
                child: ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PendingOrderDetailsScreen()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.greyColor.withOpacity(.5),
                                  blurRadius: 8.0, // soften the shadow
                                  spreadRadius: 1.0, //extend the shadow
                                  offset: const Offset(
                                    1.0, // Move to right 10  horizontally
                                    1, // Move to bottom 10 Vertically
                                  ),
                                )
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    pendingData[index]['orderNo'],
                                    style: urbanistMedium.copyWith(
                                        color: AppColors.blackColor,
                                        fontSize: width * .045),
                                  ),
                                  Text(pendingData[index]['dateTime'],
                                      style: urbanistMedium.copyWith(
                                          color: AppColors.darkblueColor,
                                          fontSize: width * .045)),
                                ],
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("CUSTOMER",
                                      style: urbanistSemiBold.copyWith(
                                          color: AppColors.greyColor,
                                          fontSize: width * .035)),
                                  Text("ORDER PRICE",
                                      style: urbanistSemiBold.copyWith(
                                          color: AppColors.greyColor,
                                          fontSize: width * .035))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    pendingData[index]['name'],
                                    style: urbanistMedium.copyWith(
                                        color: AppColors.blackColor,
                                        fontSize: width * .045),
                                  ),
                                  Text(pendingData[index]['price'],
                                      style: urbanistMedium.copyWith(
                                          color: AppColors.blackColor,
                                          fontSize: width * .045)),
                                ],
                              ),
                              const Divider(),
                              Text(
                                "ADDRESS",
                                style: urbanistBold.copyWith(
                                    color: AppColors.greyColor,
                                    fontSize: width * .035),
                              ),
                              Text(
                                pendingData[index]['address'],
                                style: urbanistMedium.copyWith(
                                    color: AppColors.blackColor,
                                    fontSize: width * .04),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    height: height * .03,
                                    width: width * .3,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(width * .02),
                                        color: index == 1
                                            ? AppColors.orangeColor
                                            : AppColors.darkblueColor),
                                    child: Center(
                                        child: Text(
                                      pendingData[index]['status'],
                                      style: urbanistBold.copyWith(
                                          color: AppColors.whiteColor,
                                          fontSize: width * .035),
                                    )),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Container(
                        height: height * .02,
                      );
                    },
                    itemCount: pendingData.length),
              ),
            ),
          )
        ],
      ),
    );
  }
}
