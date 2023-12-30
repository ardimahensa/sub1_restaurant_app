class RestaurantList {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;

  RestaurantList({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  factory RestaurantList.fromJson(Map<String, dynamic> restaurantlist) {
    return RestaurantList(
      id: restaurantlist['id'],
      name: restaurantlist['name'],
      description: restaurantlist['description'],
      pictureId: restaurantlist['pictureId'],
      city: restaurantlist['city'],
      rating: (restaurantlist['rating'] as num).toDouble(),
    );
  }
}
