import 'package:baseleal/models/mezmures_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive_flutter/hive_flutter.dart';

// the database
FirebaseFirestore db = FirebaseFirestore.instance;
final _myBox = Hive.box('myBox');

// method for get the mezmure lyrics
Future<List<Mezmure>> getMezmures() async {
  try {
    List<Mezmure> mezmures = [];
    List<Map<dynamic, dynamic>> mapMezmures = [];
    // function for iterating through the documents and puting them in the mezmures list
    final collection = await db.collection('mezmures').get();

    final docs = collection.docs;
    for (var doc in docs) {
      final mezmureModel =
          Mezmure.fromMap(doc.data()['mezmure'] as Map<String, dynamic>);
      mezmures.add(mezmureModel);
      mapMezmures.add(mezmureModel.toJson());
    }

    //if it has data its going to put in the hive

    _myBox.put(
      'mezmures',
      mapMezmures,
    );

    return mezmures;
  } catch (error) {
    return [];
  }
  //
}

Future<List<Mezmure>> fetchingMezmureFromBox() async {
  // get in the box name CarouselImageUrl
  final storedData = _myBox.get('mezmures');
  List<Mezmure> mezmures = [];

  if (storedData != null) {
    for (var mezmure in storedData) {
      mezmures.add(
        Mezmure.fromMap(mezmure),
      );
    }
    return mezmures;
  }

  return [];
}
