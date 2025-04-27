import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

Future<void> fetchImageCarousel() async {
  try {
    List<String> images = [];

    final listImageFiles = await FirebaseStorage.instance
        .ref()
        .child('BaselealPhotos')
        .listAll();

    for (var image in listImageFiles.items) {
      final dUrl = await image.getDownloadURL();
      images.add(dUrl);
    }

    if (images.isNotEmpty) {
      final inserting = <String, dynamic>{
        'imageUrls': images,
      };

      await FirebaseFirestore.instance
          .collection('BaselealPhotos')
          .add(inserting)
          .then((DocumentReference doc) {
        debugPrint('Document added with id: ${doc.id}');
      });
    } else {
      debugPrint('No images found to insert.');
    }
  } catch (e) {
    debugPrint("Error fetching image carousel: $e");
  }
}