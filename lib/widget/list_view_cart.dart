import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../service/restaurant.dart';

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
                          const Icon(Icons.location_city, color: Colors.green),
                          const SizedBox(width: 5),
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
                          const SizedBox(width: 5),
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
