import 'package:flutter/services.dart' show rootBundle;
class CommonUtil{
  static Future<String> loadAsset(String json) async {
    return await rootBundle.loadString(json);
  }
  
  static String formatDate(int date){
    var time = DateTime.fromMillisecondsSinceEpoch(date*1000);
    String dateSlug ="${time.month.toString().padLeft(2,'0')}-${time.day.toString().padLeft(2,'0')} ${time.hour.toString().padLeft(2,'0')}:${time.minute.toString().padLeft(2,'0')}";
    return dateSlug;
  }
}