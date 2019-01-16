import 'model/home_re.dart';
import 'package:flutter_app/util/common_util.dart';
import 'dart:convert' show json;
import 'dart:async' show Future;

class HomePageDataExecutor {
  static Future<List<HomeRe>> generalHomePage() async {
    Future future = CommonUtil.loadAsset("json/home_page.json");
    List<HomeRe> lists = new List();
    await future.then((news) {
      var list = json.decode(news);
      for (int i = 0; i < list.length; i++) {
        lists.add(HomeRe.fromJson(list[i]));
      }
    });

    return lists;
  }

  static Future<List<HomeRe>> refreshHomPage(int count) async {
    Future future = CommonUtil.loadAsset("json/home_page_refresh.json");
    List<HomeRe> lists = new List();
    await future.then((news) {
      var list = json.decode(news);
      if (count > list.length) {
        return null;
      }
      int start = count;
      int end = (count + 2) > list.length ? list.length : count + 2;

      for (int i = start; i < end; i++) {
        lists.add(HomeRe.fromJson(list[i]));
      }
    });

    return lists;
  }

  static Future<List<HomeRe>> moreHomPage(int count) async {
    Future future = CommonUtil.loadAsset("json/home_page_more.json");
    List<HomeRe> lists = new List();
    await future.then((news) {
      var list = json.decode(news);
      if (count > list.length) {
        return null;
      }
      int start = count;
      int end = (count + 2) > list.length ? list.length : count + 2;

      for (int i = start; i < end; i++) {
        lists.add(HomeRe.fromJson(list[i]));
      }
    });

    return lists;
  }
}
