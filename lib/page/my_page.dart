import 'package:flutter/material.dart';
import 'package:flutter_app/view/ji_top_bar.dart';
import 'package:flutter_app/view/ji_roll_pageview.dart';
import 'package:cached_network_image/cached_network_image.dart';

class JiMyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _JiMyPageState();
  }
}

class _JiMyPageState extends State<JiMyPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 1,
        child: Column(
          children: <Widget>[
            _createTopBar(),
            Expanded(
              child: TabBarView(children: <Widget>[
                _crateBody(),
              ]),
            )
          ],
        ));
  }

  Widget _createTopBar() {
    return JiTopBar(
      textList: <String>[""],
      iconList: <String>["images/ic_night.png"],
      onPressed: (index) {},
    );
  }

  Widget _crateBody() {
    var container = Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: <Widget>[
          _createHead(),
          _createCard(),
          SizedBox(height: 20,),
          _crateBanner()
        ],
      ),
    );

    return RefreshIndicator(
      onRefresh: _onRefresh,
      displacement: 20,
      child: ListView(
        children: <Widget>[container],
      ),
    );
  }

  Widget _crateBanner(){
    List<String> bannerList =[];
    bannerList.add("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547284268765&di=762d3212ae40b93dbfee4d4f4c4699d8&imgtype=0&src=http%3A%2F%2Fimg4.duitang.com%2Fuploads%2Fblog%2F201403%2F20%2F20140320140221_VrFTt.thumb.700_0.jpeg");
    bannerList.add("https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=833982181,3967302085&fm=26&gp=0.jpg");
    bannerList.add("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547284702390&di=7f37def0a11402dd7f079bd406c67b33&imgtype=0&src=http%3A%2F%2Fscimg.jb51.net%2Fallimg%2F140126%2F2-1401262204425A.jpg");
    return JiRollPageView(bannerList);
  }

  Widget _createCard() {
    var size = 16.0;

    return Card(
      margin: EdgeInsets.only(top: 20),
      child: Container(
        padding: EdgeInsets.only(right: 10,top: 16,left: 10,bottom: 16),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(right: 6), child: Image.asset("images/ic_my_jewel.png",  width: 28, height: 28),),
                Baseline(baseline: 15, baselineType: TextBaseline.alphabetic,child: Text("简书钻:", style: TextStyle(fontSize: 14),),),
                Baseline(baseline: 15, baselineType: TextBaseline.alphabetic,child: Text("5545", style: TextStyle(fontSize: 15),),),
                Expanded(child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("查看",style: TextStyle(fontSize: 12,color: Colors.black54)),
                      Padding(padding: EdgeInsets.only(left: 4), child: Image.asset("images/ic_my_arrow.png",  width: 10, height: 10),),
                    ],))
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 6,bottom: 12),child: Divider(),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Image.asset("images/ic_my_article.png",  width: 30, height: 30),
                    Padding(padding: EdgeInsets.only(top: 10,bottom: 4),child: Text("我的文章", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),),
                    SizedBox(
                      height: size,
                      child: Text("2篇私密", style: TextStyle(fontSize: 12),),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("images/ic_my_bookshelf.png",  width: 30, height: 30),
                    Padding(padding: EdgeInsets.only(top: 10,bottom: 4),child: Text("我的书架", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),),
                    SizedBox(
                      height: size,
                      child: Text("含已购内容", style: TextStyle(fontSize: 12),),
                    )
                    ,
                  ],
                ),
                Column(
                  children: <Widget>[
                    Image.asset("images/ic_my_like.png",  width: 30, height: 30),
                    Padding(padding: EdgeInsets.only(top: 10,bottom: 4),child: Text("喜欢收藏", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600)),),
                    SizedBox(
                      height: size,
                      child: Text("", style: TextStyle(fontSize: 12),),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Image.asset("images/ic_my_mission.png",  width: 30, height: 30),
                    Padding(padding: EdgeInsets.only(top: 10,bottom: 4),child: Text("奖励任务", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600)),),
                    SizedBox(
                      height: size,
                      child: Text("领简书钻", style: TextStyle(fontSize: 12),),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _createHead() {
    return Row(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 10),
            child: ClipOval(
              child: _getItemHead("images/ic_notify_comments.png", 90, 90),
            )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "二全年",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IntrinsicWidth(
                  stepWidth: 80,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "5545",
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        "关注",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                IntrinsicWidth(
                  stepWidth: 80,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "4115",
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        "粉丝",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                IntrinsicWidth(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "6459",
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        "积分",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }

  Widget _getItemHead(String url, double widthItem, double heightItem) {
    if (url == null || url == "") {
      return null;
    }

    Widget placeHolder = Container(
      color: Colors.black12,
      width: widthItem,
      height: heightItem,
    );
    return CachedNetworkImage(
        imageUrl: url,
        placeholder: placeHolder,
        errorWidget: placeHolder,
        width: widthItem,
        height: heightItem,
        fit: BoxFit.fill);
  }

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 1));
  }
}
