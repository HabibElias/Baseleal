import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive_flutter/hive_flutter.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
final box = Hive.box('myBox');

Future<String> getTodaysverse() async {
  try {
    String verse = '';

    await db.collection('Todaysverse').get().then(
      (event) {
        final docs = event.docs;
        verse = docs.first.data()['verse'];
      },
    );
    box.put('verse', verse);

    return verse;
  } catch (e) {
    return '';
  }
}

Future<String> fetchVerseFromHive() async {
  final verse = box.get('verse');
  return verse ?? '';
}
