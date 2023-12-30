import 'package:flutter/material.dart';

import '../shared/utils.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final int starCount;

  const StarRating({
    Key? key,
    required this.rating,
    this.starCount = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: List.generate(
            starCount,
            (index) {
              double ratingValue = index + 1.0;
              return Icon(
                ratingValue <= rating
                    ? Icons.star
                    : ratingValue - 0.5 <= rating
                        ? Icons.star_half
                        : Icons.star_border,
                color: Utils.mainColor,
              );
            },
          ),
        ),
        const SizedBox(width: 5), // Add some spacing between stars and text
        Text(
          '$rating', // Display the rating value as text
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
