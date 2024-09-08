import 'package:driverapp/constant/app_img.dart';
 

List<Map<String, dynamic>> data = [
  {"img": AppImages.timeIconImg, "title": "10.2", "subTitle": "Hours online"},
  {"img": AppImages.cardImg, "title": "3000 SAR", "subTitle": "Total Tips"},
  {"img": AppImages.orderImg, "title": "20", "subTitle": "Total Tips"},
];

List<Map<String, dynamic>> drawerData = [
  {"img": AppImages.homeImg, "title": "Home"},
  {"img": AppImages.myWalletImg, "title": "My Wallet"},
  {"img": AppImages.history, "title": "History"},
  {"img": AppImages.notification, "title": "Notification"},
  {"img": AppImages.logOutImg, "title": "Log Out"}
];
List<Map<String, dynamic>> notificationData = [
  {
    "img": AppImages.addIcon,
    "title": "System",
    "subTitle": "Trip#1219281 has been added"
  },
  {
    "img": AppImages.cancelIcon,
    "title": "System",
    "subTitle": "Trip #1205 has been cancelled"
  },
  {
    "img": AppImages.completeTranscationIcon,
    "title": "System",
    "subTitle": "Thank you! Your transaction is com..."
  }
];

List<Map<String, dynamic>> pendingData = [
  {
    "orderNo": "No. 8900001",
    "dateTime": "2023-01-09, 12:13:08",
    "name": "Faizan",
    "price": "47.61 SR",
    "address": "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum",
    "status": "Trip Accepted"
  },
  {
    "orderNo": "No. 8900001",
    "dateTime": "2023-01-09, 12:13:08",
    "name": "Farhal",
    "price": "47.61 SR",
    "address": "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum",
    "status": "AT CUSTOMER"
  }
];

List<Map<String, dynamic>> detailsData = [
  {
    "img": AppImages.chocolateImg,
    "name": "Colored Bell Pepper",
    "price": "12.95 x 1 = 12.95 SR",
    "quntity": "1",
    "total": "12.95 SR",
    "variant": "Variant: 1KG"
  },
  {
    "img": AppImages.bananaImg,
    "name": "Banana 1 piece",
    "price": "0.87 x 10 = 5.90 SR",
    "quntity": "10",
    "total": "5.90 SR",
    "variant": "Variant: 1KG"
  }
];
List<Map<String, dynamic>> cashData = [
  {
    "img": AppImages.walletIcon,
    "title": "Wallet",
  },
  {
    "img": AppImages.cashIcon,
    "title": "Cash",
  }
];
List<Map<String, dynamic>> contactData = [
  {"title": "Location", "img": AppImages.shareIcon},
  {"title": "Call", "img": AppImages.contectIcon},
  {"title": "Whatsapp", "img": AppImages.whatsappIcon},
  {"title": "Receivable Call", "img": AppImages.contectIcon},
  {"title": "Receivable Whatsapp", "img": AppImages.whatsappIcon},
];

List<Map<String, dynamic>> receivableData = [
  {"title": "Call", "img": AppImages.contectIcon},
  {"title": "Location", "img": AppImages.shareIcon},
  {"title": "Whatsapp", "img": AppImages.whatsappIcon}
];

List<Map<String, dynamic>> amountData = [
  {"title": "AMOUNT:", "rs": "34.45 SR"},
  {"title": "DELIVERY CHARGES:", "rs": "3.00 SR"},
  {"title": "PROMO DISCOUNT:", "rs": "25.0 SR"},
  {"title": "VAT:", "rs": "1.57 SR"},
  {"title": "TOTAL:", "rs": "14.32 SR"},
  {"title": "WALLET AMOUNT:", "rs": "14.32 SR"}
];

List<Map<String, dynamic>> graphData = [
  {"img": AppImages.carIcon, "title": "Total Trips", "rs": "10"},
  {"img": AppImages.dollarIcon, "title": "TIPS EARNED", "rs": "3000 SAR"}
];
List<Map<String, dynamic>> paymentData = [
  {"title": "TRIP # 1212121", "subTitle": "#740136", "amount": "3000 SAR"}
];
