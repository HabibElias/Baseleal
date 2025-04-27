// fetching from a gallery

import 'package:baseleal/models/gallery_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive_flutter/hive_flutter.dart';

final db = FirebaseFirestore.instance;
final _myBox = Hive.box('myBox');

Future<List<Gallery>> getGallery() async {
  try {
    List<Gallery> gallery = [];
    List<Map<String, dynamic>> galleryMap = [];

    final collection = await db.collection('gallery').get();

    final docs = collection.docs;
    
    for (var doc in docs) {
      final gallerymodel = Gallery.fromJson(doc.data());
      gallery.add(gallerymodel);
      galleryMap.add(gallerymodel.toJson());
    }

    _myBox.put('gallery', galleryMap);


    return gallery;
  } catch (e) {

    return [];
  }
}

Future<List<Gallery>> fetchGalleryFromHive() async {
  final galleryMap = _myBox.get('gallery');

  List<Gallery> gallery = [];
  if (galleryMap != null) {
    for (Map<dynamic, dynamic> map in galleryMap) {
      gallery.add(Gallery.fromJson(map));
    }
    return gallery;
  }

  return [];
}
