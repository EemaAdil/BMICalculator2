


class HiveModelFields{

  static const String key="key";
  static const String name="name";
  static const String quantity='quantity';
  static const String date='date';
  static const String weight='weight';
}

class HiveModel{
  int key;
  String name;
  String quantity;
  DateTime date;
  double weight;

  HiveModel({
   required this.key,
   required this.name,
   required this.quantity,
   required this.date,
   required  this.weight
});

  Map<String,dynamic> toMap()=>{
    HiveModelFields.key:key,
    HiveModelFields.name:name,
    HiveModelFields.quantity:quantity,
    HiveModelFields.date:date,
    HiveModelFields.weight:weight
  };

  factory HiveModel.fromJson(Map<String,dynamic> json)=>HiveModel(
    key: json[HiveModelFields.key],
    name: json[HiveModelFields.name],
    quantity: json[HiveModelFields.quantity],
    date: json[HiveModelFields.date],
    weight: json[HiveModelFields.weight],

  );



}