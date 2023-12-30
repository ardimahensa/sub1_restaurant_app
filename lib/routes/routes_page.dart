import 'package:get/get.dart';
import 'package:makan_bang/screen/home_screen.dart';
import 'package:makan_bang/screen/splash_screen.dart';

class RoutePages {
  static final List<GetPage> pages = [
    GetPage(name: '/', page: () => const SplashScreen()),
    GetPage(name: '/homeScreen', page: () => HomeScreen()),
  ];
}
