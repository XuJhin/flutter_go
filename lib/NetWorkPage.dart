import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_go/model/BaseResponse.dart';
import 'package:flutter_go/model/PageEntity.dart';

class NetWorkPage extends StatefulWidget {
  @override
  _NetWorkPageState createState() => _NetWorkPageState();
}

class _NetWorkPageState extends State<NetWorkPage> {
  var resultJson = "";
  var urlPath = "http://test-api.wujinpu.cn/api/goods-show/shop-index-goods";

  @override
  void initState() {
    super.initState();
  }

  //  网络请求部分
  Future getRequest() async {
    var headers = {
      "platform": 1,
      "osVersion": 28,
      "appVersion": "1.12.0",
      "deviceName": "OPPO/PBBM00",
      "Authorization": "Bearer 199efc06-6958-4fb4-9a8b-bacaedcf870b"
    };
    var dio = new Dio();
    dio.options.headers.addAll(headers);
    dio.options.contentType="application/json";
    dio.options.connectTimeout = 10000; // 服务器链接超时，毫秒
    dio.options.receiveTimeout = 3000; // 响应流上前后两次接受到数据的间隔，毫秒
    var params = {
      "shopId": "a7f01805db924184ad6ce4b54d11b0f8",
      "sort": "heat",
      "sortType": "1",
      "pageNo": 1,
      "pageSize": 18
    };
    try {
      Response response = await dio.get(urlPath, queryParameters: params);
      this.setState(() {
        resultJson = response.data.toString();
        var pageEntity = BaseResponse.fromJson(response.data);
        pageEntity.data.datas.forEach((goodEntity) => {
          print(goodEntity.name)}
          );
      });
      return response.data.toString();
    } catch (e) {
      return print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("网络请求"),
      ),
      body: Column(
        children: <Widget>[
          MaterialButton(
            onPressed: getRequest,
            color: Colors.cyan,
            child: Text("请求"),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: resultJson.length <= 0
                    ? Text("数据加载中")
                    : Text(
                        resultJson,
                        style: TextStyle(fontSize: 16),
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
