class CarouselModel {
  final List imageUrl;

  const CarouselModel({required this.imageUrl});

  factory CarouselModel.fromMap(Map<dynamic, dynamic> map) {
    return CarouselModel(
      imageUrl: map['imageUrls'] ?? [],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'imageUrls': imageUrl,
    };
  }
}
