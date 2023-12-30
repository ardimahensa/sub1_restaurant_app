// restaurant_controller.dart
// ignore_for_file: avoid_print

import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:makan_bang/models/restaurant_list.dart';

import '../service/restaurant_api.dart';

class RestaurantController extends GetxController {
  final RestaurantService _restaurantService = RestaurantService();
  final RxList<RestaurantList> restaurants = <RestaurantList>[].obs;
  final CarouselController carouselController = CarouselController();
  RxInt currentIndex = 0.obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchRestaurants();
  }

  Future<void> fetchRestaurants() async {
    try {
      isLoading.value = true;
      final List<RestaurantList> fetchedRestaurants =
          await _restaurantService.getRestaurants();
      restaurants.assignAll(fetchedRestaurants);
    } catch (error) {
      print('Error: $error');
    } finally {
      isLoading.value = false;
    }
  }

  // Mengambil 5 restoran berdasarkan rating tertinggi
  List<RestaurantList> getTopRatedRestaurants() {
    final sortedRestaurants = restaurants.toList()
      ..sort((a, b) => b.rating.compareTo(a.rating));
    return sortedRestaurants.take(5).toList();
  }
}
