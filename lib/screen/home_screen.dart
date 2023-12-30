import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controller/restaurant_controller.dart';
import '../shared/utils.dart';
import '../widget/big_text.dart';
import '../widget/icon_text.dart';
import '../widget/small_text.dart';
import '../widget/star_rating.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final RestaurantController restaurantController =
      Get.put(RestaurantController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          appBar(),
          const SizedBox(height: 15),
          Expanded(
            child: SingleChildScrollView(
              child: topRestaurant(),
            ),
          ),
          const SizedBox(height: 30),
          indicator(),
          const SizedBox(height: 30),
          listRestaurants(),
        ],
      ),
    );
  }

  Obx topRestaurant() {
    return Obx(
      () {
        final topRatedRestaurants =
            restaurantController.getTopRatedRestaurants();

        return CarouselSlider.builder(
          options: CarouselOptions(
            height: 320.0,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            viewportFraction: 0.8,
            aspectRatio: 2.0,
            autoPlay: true,
            onPageChanged: (index, reason) {
              restaurantController.currentIndex.value = index;
            },
          ),
          carouselController: restaurantController.carouselController,
          itemCount: topRatedRestaurants.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            final restaurant = topRatedRestaurants[index];
            const urlImage =
                'https://restaurant-api.dicoding.dev/images/medium';
            return SizedBox(
              height: 320,
              child: Stack(
                children: [
                  //gambar dari api
                  Container(
                    height: 220,
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            NetworkImage('$urlImage/${restaurant.pictureId}'),
                      ),
                    ),
                  ),
                  //top 5 restorant
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 120,
                      margin: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Container(
                        padding:
                            const EdgeInsets.only(top: 15, left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //nama restorant dari api
                            Text(restaurant.name),
                            const SizedBox(height: 10),

                            StarRating(rating: restaurant.rating),

                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                //asal kota restorant
                                IconWithText(
                                    text: restaurant.city,
                                    iconColor: Colors.yellow,
                                    icon: Icons.location_city),
                                const SizedBox(width: 5),
                                //jumlah makanan dari restorant
                                const IconWithText(
                                    text: 'Food',
                                    iconColor: Colors.red,
                                    icon: Icons.fastfood_outlined),
                                const SizedBox(width: 5),
                                //jumlah minuman dari restorant
                                const IconWithText(
                                    text: 'Drinks',
                                    iconColor: Colors.red,
                                    icon: Icons.local_drink_outlined),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Obx indicator() {
    return Obx(
      () {
        final topRatedRestaurants =
            restaurantController.getTopRatedRestaurants();

        return AnimatedSmoothIndicator(
          activeIndex: restaurantController.currentIndex.value,
          count: topRatedRestaurants.length,
          effect: ExpandingDotsEffect(
            dotColor: Utils.greyLight,
            activeDotColor: Utils.mainColor,
          ),
          onDotClicked: (index) {
            restaurantController.carouselController.animateToPage(index);
          },
        );
      },
    );
  }

  Container appBar() {
    return Container(
      margin: const EdgeInsets.only(top: 50, bottom: 15),
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //nama app
              BigText(
                text: 'Makan Bang',
                color: Utils.mainColor,
              ),
              //tagline
              const SmallText(text: 'Gak Makan Gak Asik'),
            ],
          ),
          //icon search
          Center(
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Utils.mainColor,
              ),
              child: const Icon(Icons.search, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Obx listRestaurants() {
    return Obx(() {
      if (restaurantController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Expanded(
          child: ListView.builder(
            itemCount: restaurantController.restaurants.length,
            itemBuilder: (context, index) {
              final restaurant = restaurantController.restaurants[index];
              return ListTile(
                title: Text(restaurant.name),
                subtitle: Text(restaurant.city),
                // Tambahkan widget lain sesuai kebutuhan
              );
            },
          ),
        );
      }
    });
  }
}
