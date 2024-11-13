class Photo {
  final String? alt;
  final Map<String, String> src;

  Photo({this.alt, required this.src});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      alt: json['alt'],
      src: Map<String, String>.from(json['src']),
    );
  }
}
