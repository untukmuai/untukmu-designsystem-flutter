class GeminiResponseData {
  final String searchProductTitle;
  final String searchProductHint;
  final ThemeColor themeColor;
  final List<Category> categories;

  GeminiResponseData({
    required this.searchProductTitle,
    required this.searchProductHint,
    required this.themeColor,
    required this.categories,
  });

  // Factory constructor to create an instance from JSON
  factory GeminiResponseData.fromJson(Map<String, dynamic> json) {
    return GeminiResponseData(
      searchProductTitle: json['search_product_title'] as String,
      searchProductHint: json['search_product_hint'] as String,
      themeColor: ThemeColor.fromJson(json['theme_color']),
      categories: (json['categories'] as List<dynamic>)
          .map((categoryJson) => Category.fromJson(categoryJson))
          .toList(),
    );
  }

  // Optional: Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'search_product_title': searchProductTitle,
      'search_product_hint': searchProductHint,
      'theme_color': themeColor.toJson(),
      'categories': categories.map((category) => category.toJson()).toList(),
    };
  }
}
// theme_color.dart

class ThemeColor {
  final String textColor;
  final String backgroundColor;
  final String secondaryBackgroundColor;

  ThemeColor(
      {required this.textColor,
      required this.backgroundColor,
      required this.secondaryBackgroundColor});

  factory ThemeColor.fromJson(Map<String, dynamic> json) {
    return ThemeColor(
      textColor: json['text_color'] as String,
      backgroundColor: json['background_color'] as String,
      secondaryBackgroundColor: json['secondary_background_color'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text_color': textColor,
      'background_color': backgroundColor,
      'secondary_background_color': secondaryBackgroundColor,
    };
  }
}
// category.dart

class Category {
  final String name;
  final List<SubCategory> sub;

  Category({
    required this.name,
    required this.sub,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'] as String,
      sub: (json['sub'] as List<dynamic>)
          .map((subJson) => SubCategory.fromJson(subJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'sub': sub.map((subCategory) => subCategory.toJson()).toList(),
    };
  }
}

// sub_category.dart

class SubCategory {
  final String name;
  final List<String> sub;

  SubCategory({
    required this.name,
    required this.sub,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      name: json['name'] as String,
      sub: List<String>.from(json['sub'] as List<dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'sub': sub,
    };
  }
}
