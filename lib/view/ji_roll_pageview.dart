import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class JiRollPageView extends StatefulWidget{
  final List<String> listUrl;
  JiRollPageView(this.listUrl);

  @override
  State<StatefulWidget> createState() {
    return _JiRollPageViewState();
  }

}

const timeout = const Duration(seconds: 2);
class _JiRollPageViewState extends State<JiRollPageView> with SingleTickerProviderStateMixin{

  PageController _pageController;
  TabController _tabController;
  Timer _timer;
  int _index=0;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
    _tabController = TabController(length: widget.listUrl.length,vsync: this);
    _timer = Timer.periodic(const Duration(seconds: 5), _handleTimer);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
    _tabController.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> childList = [];
    for(int i=0 ;i<widget.listUrl.length;i++){
      childList.add(_getImageByUrl(widget.listUrl[i],MediaQuery.of(context).size.width,MediaQuery.of(context).size.width * 0.2)
      );
    }

    return Stack(
      alignment: Alignment(0, 0.9),
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 0.2,
          child: PageView(
            controller: _pageController,
            onPageChanged: (index){
              _onPageChanged(index);
            },
            children: childList,
          ),
        ),
        Align(
          child: TabPageSelector(
            color: Colors.black87,
            selectedColor: Colors.white,
            indicatorSize: 8,
            controller: _tabController,
          ),
        )
      ],
    );
  }


  _onPageChanged(int index) {
    print("====_onPageChanged====$index");
    _index = index;
    _tabController.animateTo(index);
  }


  _handleTimer(Timer timer){
    _index ++;
    var toPage = _index % widget.listUrl.length;
    print("====_handleTimer====$_index");
    print("====_handleTimer====$toPage");
    _pageController.animateToPage(toPage, duration: Duration(milliseconds: 16), curve: Curves.fastOutSlowIn);

    _tabController.animateTo(toPage);
  }


  Widget _getImageByUrl(String url,double widthItem,double heightItem){
    if(url == null || url == ""){
      return null;
    }

    Widget placeHolder = Container(
      color: Colors.black12,
      width: widthItem,
      height: heightItem,
    );
    return  CachedNetworkImage(
        imageUrl: url,
        placeholder: placeHolder,
        errorWidget: placeHolder,
        width: widthItem,
        height: heightItem,
        fit: BoxFit.fill);
  }


}