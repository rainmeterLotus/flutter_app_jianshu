import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class ToastUtil{
  static void show(String msg,{Toast length}){
    if(length == null){
      length = Toast.LENGTH_SHORT;
    }
    Fluttertoast.showToast(msg: msg,
        toastLength: length,
        backgroundColor: Color(0xaa000000),
        textColor: Color(0xffffffff));
  }
}