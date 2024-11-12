// Product model
class Product {
  final String title;
  final String link;
  final String thumbnail;
  final String price;
  final double extractedPrice;

  Product({
    required this.title,
    required this.link,
    required this.thumbnail,
    required this.price,
    required this.extractedPrice,
  });

  // Create a Product from JSON data
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json["title"],
      link: json["link"],
      thumbnail: json["thumbnail"],
      price: json["price"].replaceAll("Â", ""),
      extractedPrice: json["extracted_price"].toDouble(),
    );
  }
}
