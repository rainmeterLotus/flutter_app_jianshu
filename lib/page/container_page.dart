import 'package:flutter/material.dart';
import 'package:flutter_app/indicator/indicator.dart';
import 'home_page.dart';
import 'focus_page.dart';
import 'msg_page.dart';
import 'my_page.dart';
import 'package:flutter_app/test/test.dart';
import 'dart:io';
import 'package:flutter/services.dart';

class JiContainerPage extends StatefulWidget {
  @override
  _JiContainerPageState createState() {
    return _JiContainerPageState();
  }
}

class _JiContainerPageState extends State<JiContainerPage>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController(initialPage: 0);
  int _tabIndex = 0;

  _onPageChange(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  Image _getBarIcon(int index, bool isActive) {
    if (index == 0) {
      return _getAssetIcon(
          isActive ? "images/ic_bar_home_ed.png" : "images/ic_bar_home.png");
    } else if (index == 1) {
      return _getAssetIcon(
          isActive ? "images/ic_bar_focus_ed.png" : "images/ic_bar_focus.png");
    } else if (index == 2) {
      return Image.asset("images/ic_tab_publish.png", width: 36.0, height: 36.0);
    } else if (index == 3){
      return _getAssetIcon(isActive
          ? "images/ic_bar_notify_ed.png"
          : "images/ic_bar_notify.png");
    } else{
      return _getAssetIcon(
      isActive ? "images/ic_bar_me_ed.png" : "images/ic_bar_me.png");
    }
  }

  Image _getAssetIcon(String path) {
    return Image.asset(path, width: 24.0, height: 24.0);
  }

  Text _getBarText(int index) {
    if (index == 0) {
      return Text("首页", style: TextStyle(fontSize: 9));
    } else if (index == 1) {
      return Text("发现", style: TextStyle(fontSize: 9));
    } else if (index == 3) {
      return Text("消息", style: TextStyle(fontSize: 9));
    } else {
      return Text("我的", style: TextStyle(fontSize: 9));
    }
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
          body: PageView.builder(
            onPageChanged: _onPageChange,
            controller: _pageController,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return new JiHomePage();
              } else if (index == 1) {
                return new JiFocusPage();
              } else if (index == 2) {
                return new JiMsgPage();
              } else if (index == 3) {
                return new JiMyPage();
              }
            },
            itemCount: 4,
          ),
          bottomNavigationBar: JiBottomBar(
              backgroundColor: Colors.transparent,
              currentIndex: _tabIndex,
              textFocusColor: Colors.deepOrange,
              onTap: (index,isPublish){
                print("===index====$index");
                print("===isPublish====$isPublish");
                if(isPublish){

                }else{
                  _pageController.jumpToPage(index);
                  _onPageChange(index);
                }

              },
              items: <JiBottomBarItem>[
                JiBottomBarItem(
                    icon: _getBarIcon(0, false),
                    title: _getBarText(0),
                    activeIcon: _getBarIcon(0, true)),
                JiBottomBarItem(
                    icon: _getBarIcon(1, false),
                    title: _getBarText(1),
                    activeIcon: _getBarIcon(1, true)),
                JiBottomBarItem(icon: _getBarIcon(2, true),isExtend: true),
                JiBottomBarItem(
                    icon: _getBarIcon(3, false),
                    title: _getBarText(3),
                    activeIcon: _getBarIcon(3, true)),
                JiBottomBarItem(
                    icon: _getBarIcon(4, false),
                    title: _getBarText(4),
                    activeIcon: _getBarIcon(4, true)),
              ])),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
