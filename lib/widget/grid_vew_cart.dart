import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../service/restaurant.dart';
import '../utils.dart';

class GridViewCart extends StatelessWidget {
  final Restaurant restaurant;
  const GridViewCart({required this.restaurant, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: 200,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(restaurant.pictureId),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 1,
                      right: 1,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: greylight,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: <Widget>[
                            const Icon(Icons.star, color: Colors.yellow),
                            const SizedBox(width: 5.0),
                            Text(
                              '${restaurant.rating}',
                              style: const TextStyle(fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
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
                          const Icon(Icons.location_city, color: Colors.green),
                          const SizedBox(width: 5),
                          Text(
                            restaurant.city,
                            style: const TextStyle(fontSize: 14.0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
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
