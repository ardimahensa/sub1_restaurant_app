// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sub1_restaurant_app/service/restaurant.dart';
import 'package:sub1_restaurant_app/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late RestaurantList _restaurantList = RestaurantList(restaurants: []);
  late ScrollController _scrollController;
  bool _isScrolled = false;
  bool _isGridViewCart = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_handleScroll);
    _localApiRestaurant();
  }

  Future<void> _localApiRestaurant() async {
    try {
      String jsonString =
          await rootBundle.loadString('assets/json/local_restaurant.json');
      final Map<String, dynamic> jsonData = jsonDecode(jsonString);
      setState(() {
        _restaurantList = RestaurantList.fromJson(jsonData);
      });
    } catch (error) {
      Center(
        child: Lottie.asset('assets/image/cheff.json', height: 200, width: 200),
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    setState(() {
      _isScrolled = _scrollController.hasClients &&
          _scrollController.offset > (200.0 - kToolbarHeight);
    });
  }

  void _toggleView() {
    setState(() {
      _isGridViewCart = !_isGridViewCart;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            title: _isScrolled
                ? null
                : Center(
                    child: SizedBox(
                      height: kToolbarHeight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.food_bank, color: white),
                          Text(
                            "MAKAN BANG",
                            style: titleText.copyWith(
                              fontSize: 24,
                              color: white,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                                _isGridViewCart ? Icons.list : Icons.grid_on,
                                color: Colors.white),
                            onPressed: _toggleView,
                          ),
                        ],
                      ),
                    ),
                  ),
            backgroundColor: _isScrolled ? greyDark : redDark,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(10.0),
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _isScrolled
                        ? const SizedBox()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Lottie.asset(
                                'assets/image/sandwich.json',
                                width: MediaQuery.of(context).size.width / 3,
                                height: MediaQuery.of(context).size.height / 8,
                              ),
                              Lottie.asset(
                                'assets/image/cheff.json',
                                width: MediaQuery.of(context).size.width / 3,
                                height: MediaQuery.of(context).size.height / 8,
                              ),
                            ],
                          ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      height: MediaQuery.of(context).size.width / 9,
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: greylight,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: greyDark,
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: TextField(
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Cari yang kamu mau',
                                labelStyle: const TextStyle(
                                  fontSize: 12,
                                ),
                                hintStyle: TextStyle(
                                  color: greylight,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          const Icon(
                            Icons.fastfood,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final restaurant = _restaurantList.restaurants[index];
                return ListViewCart(restaurant: restaurant);
              },
              childCount: _restaurantList.restaurants.length,
            ),
          ),
        ],
      ),
    );
  }
}

class ListViewCart extends StatelessWidget {
  final Restaurant restaurant;

  const ListViewCart({required this.restaurant, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 8, 18, 8),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: 120,
          child: Row(
            children: [
              Expanded(
                flex: 10,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(restaurant.pictureId),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 14,
                child: Container(
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 8),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          restaurant.name,
                          style: GoogleFonts.montserrat(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: <Widget>[
                          const Icon(Icons.map, color: Colors.green),
                          Text(
                            restaurant.city,
                            style: const TextStyle(fontSize: 14.0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: <Widget>[
                          const Icon(Icons.star, color: Colors.yellow),
                          Text(
                            '${restaurant.rating}',
                            style: const TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GridViewCart extends StatelessWidget {
  final Restaurant restaurant;
  const GridViewCart({required this.restaurant, super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
