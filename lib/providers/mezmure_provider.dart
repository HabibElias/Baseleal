import 'package:baseleal/models/mezmures_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

final _myBox = Hive.box('myBox');

class MezmureProvider extends ChangeNotifier {
  
  final List<Mezmure> _mezmures = _myBox.get('mezmures');

  get getMezmures => _mezmures;
}
