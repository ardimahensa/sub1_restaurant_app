// restaurant_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:makan_bang/models/restaurant_list.dart';

class RestaurantService {
  static const String baseUrl =
      'https://restaurant-api.dicoding.dev/'; // Ganti dengan URL API sesuai kebutuhan

  Future<List<RestaurantList>> getRestaurants() async {
    final response = await http.get(Uri.parse('$baseUrl/list'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> restaurantsData = data['restaurants'];

      final List<RestaurantList> restaurants = restaurantsData
          .map((restaurant) => RestaurantList.fromJson(restaurant))
          .toList();

      return restaurants;
    } else {
      throw Exception('Failed to load restaurants');
    }
  }
}
