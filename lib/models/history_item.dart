class HistoryItem {
  final String title;
  final String category;
  final String route;
  final DateTime dateTime;

  // Favorite Option
  final bool favorite;

  const HistoryItem({
    required this.title,
    required this.category,
    required this.route,
    required this.dateTime,
    this.favorite = false,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "category": category,
      "route": route,
      "dateTime": dateTime.toIso8601String(),
      "favorite": favorite,
    };
  }

  factory HistoryItem.fromJson(Map<String, dynamic> json) {
    return HistoryItem(
      title: json["title"] ?? "",
      category: json["category"] ?? "",
      route: json["route"] ?? "",
      dateTime: DateTime.parse(json["dateTime"]),
      favorite: json["favorite"] ?? false,
    );
  }

  HistoryItem copyWith({
    String? title,
    String? category,
    String? route,
    DateTime? dateTime,
    bool? favorite,
  }) {
    return HistoryItem(
      title: title ?? this.title,
      category: category ?? this.category,
      route: route ?? this.route,
      dateTime: dateTime ?? this.dateTime,
      favorite: favorite ?? this.favorite,
    );
  }
}