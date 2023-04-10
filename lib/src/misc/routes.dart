import 'package:get/get.dart';
import '../screens/home.dart';

enum Screen {
  home,
  welcome,
  qrcode,
}

extension ScreenExtentsion on Screen {
  String get route => '/$name';
}

abstract class RouteNavigator {
  static List<GetPage> screens = [
    // GetPage(
    //   name: welcome,
    //   page: () => WelcomePage(),
    //   middlewares: const [],
    // ),
    GetPage(name: Screen.home.route, page: () => const HomeScreen()),
    // GetPage(name: qrCode, page: () => QRCode()),
  ];
}
