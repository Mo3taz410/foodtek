enum FoodCategory {
  all,
  burger,
  pizza,
  sandwich,
}

class FoodModel {
  final String id;
  final String name;
  final String description;
  final double originalPrice;
  final double? discountedPrice;
  final double rating;
  final String image;
  final FoodCategory category;
  final bool isTopRated;
  final bool isRecommended;
  final bool isFavorite;
  final int spiceLevel;
  final int inCartQuantity;
  final DateTime? orderedAt;
  final int orderedCount;

  FoodModel({
    required this.id,
    required this.name,
    required this.description,
    required this.originalPrice,
    this.discountedPrice,
    required this.rating,
    required this.image,
    required this.category,
    this.isTopRated = false,
    this.isRecommended = false,
    this.isFavorite = false,
    this.spiceLevel = 0,
    this.inCartQuantity = 0,
    this.orderedAt,
    this.orderedCount = 0,
  });

  double get currentPrice => discountedPrice ?? originalPrice;

  int? get discountPercent {
    if (discountedPrice == null) return null;
    final percent = ((1 - (discountedPrice! / originalPrice)) * 100).round();
    return percent > 0 ? percent : null;
  }

  /// for reordering
  FoodModel copyWith({
    int? inCartQuantity,
    DateTime? orderedAt,
    int? orderedCount,
  }) {
    return FoodModel(
      id: id,
      name: name,
      description: description,
      originalPrice: originalPrice,
      discountedPrice: discountedPrice,
      rating: rating,
      image: image,
      category: category,
      isTopRated: isTopRated,
      isRecommended: isRecommended,
      isFavorite: isFavorite,
      spiceLevel: spiceLevel,
      inCartQuantity: inCartQuantity ?? this.inCartQuantity,
      orderedAt: orderedAt ?? this.orderedAt,
      orderedCount: orderedCount ?? this.orderedCount,
    );
  }
}
