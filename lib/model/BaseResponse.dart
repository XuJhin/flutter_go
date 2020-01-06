import 'package:flutter_go/model/PageEntity.dart';

class BaseResponse extends Object {
  String msg;
  PageEntity data;
  String code;

  static BaseResponse fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    BaseResponse baseResponse = BaseResponse();
    baseResponse.msg = json['msg'];
    baseResponse.code = json['code'];
    baseResponse.data =PageEntity.fromJson(json['data'] as Map<String, dynamic>);
  }
}
