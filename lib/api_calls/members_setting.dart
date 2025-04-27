import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

List<String> members = [
  "Habib Elias",
  "Rachel Tamene",
  "Rediet Teklu",
  "Tadese Wonago",
  "Menen Hailu",
  "Betelehem Shegute",
  "Degu Degefe",
  "Habte Lerebo",
  "Tamerat",
  "Dagim Wondimu",
  "Tsegab Tekelu",
  "Temesgen abebe",
  "Meseret",
  "Melat Debebe",
  "Eyob Yohannes - Leader",
  "Kebron Ermias",
  "Abel Abeje",
  "Niftalem T.selassie",
  "Enjo Yohannes",
  "Zerihun Abeje",
  "Tihitna Tadege",
  "Menderin Samuel",
  "Nathan Sisay",
  "Adonit Milkias",
  "Robel Bekele",
  "Robel Esayas",
  "Lydia Wondimu",
  "Ephrathah Hailu",
  "Akinahom Ashenafi",
  "Tsebaot Ashenafi",
  "Weke Weshera",
  "Betselot Teshome",
  "Selam Tadege",
  "Selam Tamene",
  "Wudasse Getachew",
  "Tsega Getayawkshal",
  "Genet Worku",
  "Seble Kasoye",
  "Hiwot Ermias - Leader",
  "Salem Ketema",
  "Mastewal Teshemo",
  "Atote Getachew",
  "Blen Negatu",
  "Nebiyu Cheru",
  "Kidest Debebe",
  "Meron Alemu",
  "Tesfa Shegute",
  "Abimelech Debebe",
  "Abenezer Mohammed",
  "Kenna Kebede",
  "Meheret Meskerem",
  "Nardos Milion",
  "Wasehun Cheru",
  "Erteban Debebe",
  "Mila Aberu",
  "Eyasu Thomas",
  "Tekle Getayawkal",
  "Zerubabel Kassahun",
];

Future<void> setMembers() async {
  try {
    final inserting = <String, dynamic>{
      'members': members,
    };

    await FirebaseFirestore.instance.collection('members').add(inserting).then(
      (DocumentReference doc) {
        debugPrint('Document added with id: ${doc.id}');
      },
    );
  } catch (e) {
    debugPrint("Error fetching image carousel: $e");
  }
}
