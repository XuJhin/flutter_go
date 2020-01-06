import 'package:flutter_go/model/GoodEntity.dart';

class PageEntity extends Object {
  int pageNo;
  int totalCount;
  int pageSize;
  int totalPage;
  List<GoodEntity> datas;

  static PageEntity fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    PageEntity pageEntity = PageEntity();
    pageEntity.pageNo = json['pageNo'];
    pageEntity.totalCount = json['totalCount'];
    pageEntity.pageSize = json['pageSize'];
    pageEntity.totalPage = json['totalPage'];
    pageEntity.datas = List()
      ..addAll((json['datas'] as List ?? []).map((o) => GoodEntity.fromJson(o)));
  }
}
