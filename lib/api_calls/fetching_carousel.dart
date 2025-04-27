import 'package:baseleal/models/carousel_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive_flutter/hive_flutter.dart';

final db = FirebaseFirestore.instance;
final _myBox = Hive.box('myBox');

Future<List> getImageUrls() async {
  try {
    List imageUrls = [];
    await db.collection('BaselealPhotos').get().then(
      (event) {
        final docs = event.docs;
        for (var doc in docs) {
          final imageModel = CarouselModel.fromMap(doc.data());
          imageUrls.addAll(imageModel.imageUrl);
        }
      },
    );

    _myBox.put('CarouselImageUrl', imageUrls);
    return imageUrls;
  } catch (e) {
    return [];
  }
}

Future<List> fetchingImageUrlFromBox() async {
  // get in the box name CarouselImageUrl
  final storedData = _myBox.get('CarouselImageUrl');
  return storedData ?? [];
}
