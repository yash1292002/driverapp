import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static late final SharedPreferences instance;

  static Future<SharedPreferences> init() async =>
      instance = await SharedPreferences.getInstance();

// Set the token.
  bool setToken(String value) {
    try {
      instance.setString("token", value);
      return true;
    } catch (e) {
      return false;
    }
  }

// Get the session id.
  String? getToken() {
    return instance.getString("token");
  }

  // set the refresh Token
  bool setRefreshToken(String value) {
    try {
      instance.setString("refreshToken", value);
      return true;
    } catch (e) {
      return false;
    }
  }

// get the refreshToke
  String? getRefreshToken() {
    return instance.getString("refreshToken");
  }

// set the user number
  bool setUserNumber(String value) {
    try {
      instance.setString("userNumber", value);
      return true;
    } catch (e) {
      return false;
    }
  }

// get the user number
  String? getUserNumber() {
    return instance.getString("userNumber");
  }

// set the user password
  bool setUserPassword(String value) {
    try {
      instance.setString("userPassword", value);
      return true;
    } catch (e) {
      return false;
    }
  }

// get the user password
  String? getUserPassword() {
    return instance.getString("userPassword");
  }

// Remove the session id when logout.
  void logout() async {
    await instance.remove("token");
    await FirebaseMessaging.instance.deleteToken();
    await instance.remove("addressType");
    await instance.remove("isRegister");
    await instance.remove("isOnline");
  }

  // Set the login.
  bool setLogin(int isRegister) {
    try {
      instance.setInt("isRegister", isRegister);
      return true;
    } catch (e) {
      return false;
    }
  }

  // Get the login.
  int? getLogin() {
    return instance.getInt("isRegister");
  }

  // Set the isOnline.
  bool setOnline(String isOnline) {
    try {
      instance.setString("isOnline", isOnline);
      return true;
    } catch (e) {
      return false;
    }
  }

  // Get the isOnline.
  String? getOnline() {
    return instance.getString("isOnline");
  }

  // set the user number
  bool setUserlat(String value) {
    try {
      instance.setString("userlat", value);
      return true;
    } catch (e) {
      return false;
    }
  }

// get the user number
  String? getUserlat() {
    return instance.getString("userlat");
  } // set the user number

  bool setUserlong(String value) {
    try {
      instance.setString("userlong", value);
      return true;
    } catch (e) {
      return false;
    }
  }

// get the user number
  String? getUserlong() {
    return instance.getString("userlong");
  }
}
