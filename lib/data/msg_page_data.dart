import 'model/msg_jianxin.dart';
import 'package:flutter_app/util/common_util.dart';
import 'dart:convert' show json;
import 'dart:async' show Future;

class MsgPageDataExecutor{

  static Future<List<JXinMsg>> generalMsgData()async{
    Future future = CommonUtil.loadAsset("json/msg_page_jianxin.json");
    List<JXinMsg> lists = new List();
    await future.then((news) {
      var list = json.decode(news);
      for (int i = 0; i < list.length; i++) {
        lists.add(JXinMsg.fromJson(list[i]));
      }
    });

    return lists;
  }

}