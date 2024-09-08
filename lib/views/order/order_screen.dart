// ignore_for_file: prefer_interpolation_to_compose_strings, no_leading_underscores_for_local_identifiers

import 'package:driverapp/controller/order_controller.dart';
import 'package:driverapp/views/Home_screen/drawer.dart';
import 'package:driverapp/views/order/cancel_order/cancel_orders.dart';
import 'package:driverapp/views/order/deliverd_order/deliverd_orders.dart';
import 'package:driverapp/views/order/pending__order/pending_orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:driverapp/constant/app_colors.dart';
import 'package:driverapp/constant/app_textStyle.dart';
import 'package:driverapp/controller/auth_controller.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    OrderController _controller =
        Provider.of<OrderController>(context, listen: false);
    AuthController controller =
        Provider.of<AuthController>(context, listen: false);
    _controller.resetOrderList();
    controller.getdriverProfiles().then((value) => {
          _controller.getDriverOrderWithStatus("pending").then((value) {
            _controller.getDriverOrderWithStatus("delivered").then((value) {
              _controller.getDriverOrderWithStatus("cancelled").then((value) {
                setState(() {
                  isLoading = false;
                });
              });
            });
          }),
        });
    _tabController = TabController(length: 3, vsync: this);
  }

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
        title: Text(
          controller.isConsent == true ? "Online" : "Offline",
          style: urbanistSemiBold.copyWith(color: AppColors.blackColor),
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: width * .03),
            child: FlutterSwitch(
              width: width * .1,
              height: width * .05,
              toggleSize: width * .04,
              value: controller.isConsent!,
              activeToggleColor: AppColors.lightGreen,
              inactiveToggleColor: Color(0xffFF0000),
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
                _orderController.changeDriverStatus(val ? 1 : 0);

                //if (controller.isConsent == false) {
                // Timer(const Duration(seconds: 1), () {
                //   Navigator.pushAndRemoveUntil(
                //       context,
                //       PageTransition(
                //         duration: const Duration(milliseconds: 300),
                //         reverseDuration: const Duration(milliseconds: 300),
                //         type: PageTransitionType.rightToLeft,
                //         child: const HomeScreen(),
                //       ),
                //       (route) => false);
                // });
                // }
              },
            ),
          ),
        ],
      ),
      drawer: NavigationDrawerPage(),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Container(
                  height: height * .05,
                  width: width,
                  padding: EdgeInsets.only(left: width * .04),
                  color: AppColors.darkblueColor,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        _orderController.getPendingOrderInfo!.isEmpty
                            ? "Hi ${controller.getUserDataInfo?.name} , You have 0 new pending requests."
                            : "Hi ${controller.getUserDataInfo?.name} , You have ${_orderController.getPendingOrderInfo!.length.toString()} new pending requests.",
                        style: urbanistSemiBold.copyWith(
                            color: AppColors.whiteColor,
                            fontSize: width * .04)),
                  ),
                ),
                Stack(
                    fit: StackFit.passthrough,
                    alignment: Alignment.bottomLeft,
                    children: [
                      TabBar(
                        controller: _tabController,
                        labelColor: AppColors.darkblueColor,
                        indicatorColor: AppColors.darkblueColor,
                        isScrollable: true,
                        automaticIndicatorColorAdjustment: true,
                        unselectedLabelColor: AppColors.greyColor,
                        labelStyle:
                            urbanistMedium.copyWith(fontSize: width * .048),
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: <Widget>[
                          Tab(
                            text: _orderController.getPendingOrderInfo!.isEmpty
                                ? "Pending\t(0)"
                                : "Pending\t(" +
                                    _orderController.getPendingOrderInfo!.length
                                        .toString() +
                                    ")",
                          ),
                          Tab(
                            text: _orderController.getDeliverdOrderInfo!.isEmpty
                                ? "Delivered\t(0)"
                                : "Delivered\t(" +
                                    _orderController
                                        .getDeliverdOrderInfo!.length
                                        .toString() +
                                    ")",
                          ),
                          Tab(
                              text: _orderController.getCancelOrderInfo!.isEmpty
                                  ? "Cancelled\t(0)"
                                  : "Cancelled\t(" +
                                      _orderController
                                          .getCancelOrderInfo!.length
                                          .toString() +
                                      ")"),
                        ],
                      ),
                    ]),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      height: height * .8,
                      child: TabBarView(
                        controller: _tabController,
                        children: const <Widget>[
                          PendingOrdersScreen(),
                          DeliverdOrdersScreen(),
                          CancelOrdersScreen(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
