// ignore_for_file: prefer_final_fields, avoid_print,, override_on_non_overriding_member, prefer_interpolation_to_compose_strings, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:driverapp/Services/api_services.dart';
import 'package:driverapp/models/get_user_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:driverapp/Services/sharedprefrence.dart';
import 'package:driverapp/constant/app_colors.dart';
 
class AuthController extends ChangeNotifier {
  TextEditingController _numberController = TextEditingController();
  TextEditingController _passworVerifyController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  bool? _isConsent = false;
  bool? get isConsent => _isConsent;
  TextEditingController get numberController => _numberController;
  TextEditingController get amountController => _amountController;
  TextEditingController get passwordVerifyController =>
      _passworVerifyController;
  void reset() {
    _numberController = TextEditingController();
    _passworVerifyController = TextEditingController();
  }

  void setConsent(bool val) {
    _isConsent = val;
    log("  " + val.toString());
    if (val == true) {
      SharedPrefService().setOnline('online');
    } else {
      SharedPrefService().setOnline('offline');
    }
    notifyListeners();
  }

  void setConsent1(bool val) {
    _isConsent = val;
    if (val == true) {
      SharedPrefService().setOnline('online');
    } else {
      SharedPrefService().setOnline('offline');
    }
  }

  @override
  void onInit() {
    determinePosition();
    getCurrentLocation();
  }

  Position? _position;
  Position? get position => _position;
  double? _latitude;
  double? get latitude => _latitude;
  double? _longitude;
  double? get longitude => _longitude;
  Set<Marker> markers = {};
  CameraPosition? _kLake;
  CameraPosition? get kLake => _kLake;

  Future<dynamic> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return await Geolocator.requestPermission()
          .then((value) {})
          .onError((error, stackTrace) async {
        await Geolocator.requestPermission();
      });
      // Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return getCurrentLocation();
  }

  Future getCurrentLocation() async {
    _position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    _latitude = position?.latitude;
    _longitude = position?.longitude;
    SharedPrefService().setUserlat(_latitude.toString());
    SharedPrefService().setUserlong(_longitude.toString());
    print("latlng:: $latitude,$longitude");
    _kLake = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(latitude ?? 0, longitude ?? 0),
        tilt: 59.440717697143555,
        zoom: 12);
    onMarker();
    notifyListeners();
  }

  onMarker() {
    markers.add(Marker(
        markerId: const MarkerId("1"),
        position: LatLng(latitude ?? 0, longitude ?? 0),
        flat: false,
        consumeTapEvents: true,
        draggable: true,
        visible: true,
        icon: BitmapDescriptor.defaultMarker));
  }

  Future<void> setFcmToken() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    log("fcm token ======> " + fcmToken.toString());
  }

  Future checkDriverMobileNo() async {
    var response = await ApiServices().checkDriverMobile(_numberController);
    if (response != null) {
      print(response.data);
      if (response.statusCode == 201) {
        SharedPrefService().setLogin(response.data['is_registered']);
        print(
            "here is check mobile nmber ius register or not == ${response.data}");
        return true;
      } else {
        return false;
      }
    }
  }

  Future driverLogin() async {
    String? latitude = await SharedPrefService().getUserlat();
    String? longitude = await SharedPrefService().getUserlong();
    var response = await ApiServices().driverLogin(
        _numberController, _passworVerifyController, latitude, longitude);
    if (response != null) {
      if (response.statusCode == 201) {
        SharedPrefService().setUserNumber(_numberController.text);
        SharedPrefService().setUserPassword(_passworVerifyController.text);
        SharedPrefService().setToken(response.data!['accessToken'].toString());
        SharedPrefService()
            .setRefreshToken(response.data!['refreshToken'].toString());
        log("driver login response ===" + response.data.toString());
        return true;
      } else {
        return false;
      }
    }
  }

// refresh Token
  Future refreshToken(context) async {
    var response = await ApiServices().refreshToken(context);
    if (response != null) {
      log(response.statusCode.toString(), name: "Refresh Token : ");
      if (response.statusCode == 201) {
        log(response.data["accessToken"].toString(),
            name: "accessToken Token : ");
        log(response.data["refreshToken"].toString(), name: "Refresh Token : ");

        SharedPrefService().setToken(response.data["accessToken"]);
        SharedPrefService().setRefreshToken(response.data["refreshToken"]);
        return true;
      } else {
        Fluttertoast.showToast(
            msg: "Something went wrong!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: AppColors.whiteColor,
            textColor: AppColors.greenColor,
            fontSize: 15);
        return false;
      }
    }
  }

  GetUserDataInfo? _getUserDataInfo;
  GetUserDataInfo? get getUserDataInfo => _getUserDataInfo;

  Future getdriverProfiles() async {
    var response = await ApiServices().getdriverProfile();
    if (response != null) {
      if (response.statusCode == 200) {
        GetUserData? _data = getUserDataFromJson(json.encode(response.data));
        _getUserDataInfo = _data.data;
        notifyListeners();
        return true;
      } else {
        return false;
      }
    }
  }

  Future UpdateLocation() async {
    var response = await ApiServices().UpdateLocation(longitude, latitude);
    if (response != null) {
      if (response.statusCode == 200) {
        log("every 30 secound location update==" + response.data.toString());
        return true;
      } else {
        return false;
      }
    }
  }
}
