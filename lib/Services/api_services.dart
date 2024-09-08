// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers, prefer_interpolation_to_compose_strings, body_might_complete_normally_nullable, deprecated_member_use

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart' as d;
import 'package:driverapp/Services/sharedprefrence.dart';
import 'dart:io' as io;

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
 

import '../views/Auth/login_screen.dart';

class ApiServices {
  // String baseUrl = "https://stageapis.yaafoods.com/api/driver/";
  // String baseUrl = "https://api.yaafoods.com/";
  // String baseUrl = "https://qaapis.yaafoods.com/api/driver/";
  String baseUrl = "https://api.yaafoods.com/api/driver/";
  d.Dio dio = d.Dio();
  d.Response? response;

  Future<d.Response?> checkDriverMobile(_numberController) async {
    try {
      response = await dio.post(baseUrl + "check-driver-mobile",
          data: json.encode({"mobile_no": _numberController.text}),
          options: d.Options(headers: {
            "accept": "*/*",
            "Content-Type": "application/json",
          }));
      if (response!.statusCode == 201) {
        return response;
      }
    } on d.DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);

        print(e.response!.requestOptions);
      } else {
        print(e.requestOptions);
        log(e.error.toString());
      }
    }
  }

  Future<d.Response?> driverLogin(_numberController, _passworVerifyController,
      _latitude, _longitude) async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    try {
      int? isRegistered = SharedPrefService().getLogin();

      var data = {
        "mobile_no": _numberController.text,
        "password": _passworVerifyController.text,
        "device_type": io.Platform.isAndroid ? "Android" : "Ios",
        "device_token": fcmToken,
        "locale": "en",
        "status": isRegistered,
        "longitude": _longitude,
        "latitude": _latitude
      };
      log(data.toString(), name: "UserLogin :: ");
      response = await dio.post(baseUrl + "login",
          data: data,
          options: d.Options(
              headers: {"accept": "*/*", "Content-Type": "application/json"}));

      if (response!.statusCode == 201) {
        return response;
      }
    } on d.DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        log("---1--");
        print(e.response!.requestOptions);
      } else {
        log("----2-");
        print(e.requestOptions);
        log(e.error.toString());
      }
    }
  }

//! --------- Refresh token Api -------------
  Future<d.Response?> refreshToken(context) async {
    String? refreshtoken = SharedPrefService().getRefreshToken();
    var token = SharedPrefService().getToken();
    log("refresh token =====>" + refreshtoken.toString());
    log("token =====>" + token.toString());
    try {
      d.Dio dio = d.Dio();
      d.Response response;
      response = await dio.post(baseUrl + "refresh",
          data: json.encode({"refresh_token": refreshtoken}),
          options: d.Options(headers: {
            "accept": "*/*",
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          }));

      if (response.statusCode == 201) {
        return response;
      }
    } on d.DioError catch (e) {
      if (e.response != null) {
        print(
            "refresh statusCode -=-=-=-=-=-=-=-=-=-= : ${e.response!.data["statusCode"]}");

        if (e.response!.data["statusCode"] == 403) {
          Navigator.pushAndRemoveUntil(
              context,
              PageTransition(
                  duration: const Duration(milliseconds: 300),
                  reverseDuration: const Duration(milliseconds: 300),
                  type: PageTransitionType.rightToLeft,
                  child: const LoginScreen()),
              (route) => false);
        }

        print(e.response!.requestOptions);
      } else {
        print(e.requestOptions);
        log(e.error.toString());
      }
    }
  }

  Future<d.Response?> getdriverProfile() async {
    try {
      String? token = SharedPrefService().getToken();

      response = await dio.get(baseUrl + "get-profile",
          options: d.Options(headers: {
            "accept": "*/*",
            "Authorization": "Bearer $token",
          }));
      if (response!.statusCode == 200) {
        return response;
      }
    } on d.DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);

        print(e.response!.requestOptions);
      } else {
        log("------");
        print(e.requestOptions);
        log(e.error.toString());
      }
    }
  }

  Future<d.Response?> getdriverOrder() async {
    try {
      String? token = SharedPrefService().getToken();
      response = await dio.get(baseUrl + "orders",
          options: d.Options(
              headers: {"accept": "*/*", "Authorization": "Bearer $token"}));
      if (response!.statusCode == 200) {
        return response;
      }
    } on d.DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);

        print(e.response!.requestOptions);
      } else {
        print(e.requestOptions);
        log(e.error.toString());
      }
    }
  }

  Future<d.Response?> getdriverOrderWithStatus(String? status) async {
    try {
      String? token = SharedPrefService().getToken();
      log("------token   " + token.toString());
      response = await dio.get(baseUrl + "orders?status=$status",
          options: d.Options(
              headers: {"accept": "*/*", "Authorization": "Bearer $token"}));
      // log("------get   " + response.toString());
      if (response!.statusCode == 200) {
        return response;
      }
    } on d.DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);

        print(e.response!.requestOptions);
      } else {
        print(e.requestOptions);
        log(e.error.toString());
      }
    }
  }

  Future<d.Response?> getOrderInfo(_orderId) async {
    try {
      String? token = SharedPrefService().getToken();
      log("------========== token   " + token.toString());
      log("------========== orderid   " + "order/$_orderId".toString());
      response = await dio.get(baseUrl + "order/$_orderId",
          options: d.Options(headers: {
            "accept": "*/*",
            "Authorization": "Bearer $token",
            'accept-language': 'en'
          }));
      log("------responce   " + response.toString());
      if (response!.statusCode == 200) {
        return response;
      }
    } on d.DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.requestOptions);
      } else {
        print(e.requestOptions);
        log(e.error.toString());
      }
    }
  }

  Future<d.Response?> changeDriverStatus(_status) async {
    try {
      String? token = SharedPrefService().getToken();

      response = await dio.put(baseUrl + "driver-device-status",
          data: json.encode({"status": _status}),
          options: d.Options(
              headers: {'accept': '*/*', "Authorization": "Bearer $token"}));
      if (response!.statusCode == 200) {
        return response;
      }
    } on d.DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);

        print(e.response!.requestOptions);
      } else {
        print(e.requestOptions);
        log(e.error.toString());
      }
    }
  }

  // here is update location api

  Future<d.Response?> UpdateLocation(longitude, latitude) async {
    try {
      String? token = SharedPrefService().getToken();

      response = await dio.put(baseUrl + "update-address",
          data: json.encode({"longitude": longitude, "latitude": latitude}),
          options: d.Options(headers: {
            'accept': '*/*',
            "Authorization": "Bearer $token",
            "Content-Type": "application/json"
          }));
      if (response!.statusCode == 200) {
        return response;
      }
    } on d.DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);

        print(e.response!.requestOptions);
      } else {
        print(e.requestOptions);
        log(e.error.toString());
      }
    }
  }

  // Future<d.Response?> orderStatusChange(
  //   orderid,
  //   status,
  // ) async {
  //   try {
  //     String? token = SharedPrefService().getToken();
  //     OrderController _controller = Provider.of(Get.context!, listen: false);
  //     d.FormData formData = d.FormData.fromMap({
  //       "order_id": orderid,
  //       "status": status,
  //       "image": await d.MultipartFile.fromFile("")
  //     });

  //     response = await dio.put(baseUrl + "driver-order-status",
  //         data: formData,
  //         options: d.Options(headers: {
  //           'accept': '*/*',
  //           'Content-Type': "multipart/form-data",
  //           "Authorization": "Bearer $token"
  //         }));

  //     if (response!.statusCode == 200) {
  //       return response;
  //     }
  //   } on d.DioError catch (e) {
  //     if (e.response != null) {
  //       print("herere"+e.response!.data);

  //       print(e.response!.requestOptions);
  //     } else {
  //       print(e.requestOptions);
  //       log(e.error.toString());
  //     }
  //   }
  // }
}
