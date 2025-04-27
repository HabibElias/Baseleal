import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive_flutter/hive_flutter.dart';

// the database
FirebaseFirestore db = FirebaseFirestore.instance;
final _myBox = Hive.box('myBox');

// method for getting member list
Future<List<dynamic>> getMembers() async {
  try {
    List<dynamic> members = [];
    // function for iterating through the documents and puting them in the mezmures list
    final collection = await db.collection('members').get();

    final docs = collection.docs;

    for (var doc in docs) {
      members.addAll(doc.data()['members'] as List<dynamic>);
    }

    //if it has data its going to put in the hive

    _myBox.put(
      'members',
      members,
    );

  
    return members;
  } catch (error) {
    return [];
  }
  //
}

Future<List<dynamic>> fetchingMembersFromBox() async {
  // get in the box name CarouselImageUrl
  final storedData = _myBox.get('members');

  if (storedData != null) {
    return storedData;
  }

  return [];
}
