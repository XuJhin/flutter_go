import 'package:json_annotation/json_annotation.dart';

class GoodEntity extends Object {
  String id;
  int monthSales;
  String name;
  String original;
  String model;
  String storeName;
  String shopId;
  String storeLogo;
  double price;
  int totalSales;

  static GoodEntity fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    GoodEntity goodEntity = GoodEntity();
    goodEntity.id = json['id'];
    goodEntity.monthSales = json['monthSales'];
    goodEntity.name = json['name'];
    goodEntity.original = json['original'];
    goodEntity.model = json['model'];
    goodEntity.storeName = json['storeName'];
    goodEntity.storeLogo = json['storeLogo'];
    goodEntity.price = json['price'];
  }
}
