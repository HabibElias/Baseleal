import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

final firebaseStorage = FirebaseStorage.instance.ref('gallery');

final db = FirebaseFirestore.instance;

Future<void> fetchGallary() async {
  try {
    Map<String, dynamic> gallery = {};

    // taking the folder name from gallery/... to ...
    String folderName = 'Concert 2025';

    // images in a folder
    List<String> folderedImageUrls = [];

    // waiting for the images to be downloaded
    final imageUrls = await firebaseStorage.child(folderName).listAll();

    // set in the folderedimagesurl list<String>
    for (var image in imageUrls.items) {
      final a = await image.getDownloadURL();
      folderedImageUrls.add(a);
    }

    gallery.addAll({
      'folderName': folderName,
      'imagesUrl': folderedImageUrls,
      'folderSize': folderedImageUrls.length,
    });
    db.collection('gallery').add(gallery).then((doc) {
      debugPrint('Gallery folder succesfully added with ${doc.id}');
    });
  } catch (e) {
    debugPrint('Fetching gallery: $e');
  }
}
