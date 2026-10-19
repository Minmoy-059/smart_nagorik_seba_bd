class FavoriteItem {
  final String title;
  final String category;
  final String route;

  const FavoriteItem({
    required this.title,
    required this.category,
    required this.route,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "category": category,
      "route": route,
    };
  }

  factory FavoriteItem.fromJson(Map<String, dynamic> json) {
    return FavoriteItem(
      title: json["title"] ?? "",
      category: json["category"] ?? "",
      route: json["route"] ?? "",
    );
  }

  FavoriteItem copyWith({
    String? title,
    String? category,
    String? route,
  }) {
    return FavoriteItem(
      title: title ?? this.title,
      category: category ?? this.category,
      route: route ?? this.route,
    );
  }
}