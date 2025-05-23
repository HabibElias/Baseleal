class Mezmure {
  final String name;
  final String mezmure;
  final String mezmureType;

  Mezmure({
    required this.name,
    required this.mezmure,
    required this.mezmureType,
  });

  factory Mezmure.fromMap(Map<dynamic, dynamic> map) {
    return Mezmure(
      name: map['name'],
      mezmure: map['mezmure'],
      mezmureType: map['mezmureType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'mezmure': mezmure,
      'mezmureType': mezmureType,
    };
  }
}
