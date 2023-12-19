import 'package:flutter/material.dart';
import 'package:sub1_restaurant_app/service/restaurant.dart';
import 'package:sub1_restaurant_app/utils.dart';

class DetailScreen extends StatelessWidget {
  final Restaurant restaurant;

  const DetailScreen({required this.restaurant, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              child: Image.network(
                restaurant.pictureId,
                width: MediaQuery.of(context).size.width,
                height: 200.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: greylight, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: titleText.copyWith(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_city,
                        color: Colors.green,
                      ),
                      const SizedBox(width: 5.0),
                      Text(
                        restaurant.city,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      const SizedBox(width: 5.0),
                      Text(
                        "${restaurant.rating}",
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: greylight, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  const Text(
                    "Tentang Restorant Ini:",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    restaurant.description,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            const Text(
              "Menu Makanan:",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Wrap(
              direction: Axis.horizontal,
              spacing: 8.0, // Spasi antar item
              runSpacing: 8.0, // Spasi antar baris jika melebihi lebar layar
              children: [
                for (var food in restaurant.menus.foods)
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(food.name),
                  ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Menu Minuman:",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Wrap(
              direction: Axis.horizontal,
              spacing: 8.0, // Spasi antar item
              runSpacing: 8.0, // Spasi antar baris jika melebihi lebar layar
              children: [
                for (var drink in restaurant.menus.drinks)
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(drink.name),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
