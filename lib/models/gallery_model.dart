class Gallery {
  final String folderName;
  final String folderSize;
  final List<dynamic> imageUrls;

  Gallery({
    required this.folderName,
    required this.folderSize,
    required this.imageUrls,
  });

  factory Gallery.fromJson(Map<dynamic, dynamic> map) {
    return Gallery(
      folderName: map['folderName'] ?? '',
      folderSize: map['folderSize'].toString(),
      imageUrls: map['imagesUrl'] ?? [],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'folderName': folderName,
      'folderSize': folderSize,
      'imagesUrl': imageUrls,
    };
  }
}
