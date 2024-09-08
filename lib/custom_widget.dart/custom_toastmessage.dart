import 'package:driverapp/constant/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
 

class CommonToastWidget {
  static Future toastMsg(msg) {
    return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.whiteColor,
      textColor: AppColors.darkblueColor,
      fontSize: 15,
    );
  }
}
