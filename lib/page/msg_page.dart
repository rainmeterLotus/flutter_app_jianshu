import 'package:flutter/material.dart';
import 'package:flutter_app/view/ji_top_bar.dart';
import 'package:flutter_app/data/model/msg_jianxin.dart';
import 'package:flutter_app/data/msg_page_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_app/util/common_util.dart';

class JiMsgPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _JiMsgPageState();
  }
}

class _JiMsgPageState extends State<JiMsgPage>{
  List<JXinMsg> dataList = [];
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    List<JXinMsg> dataList = await MsgPageDataExecutor.generalMsgData();
    setState(() {
      this.dataList = dataList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: Column(
          children: <Widget>[
            _createTopBar(),
            Expanded(
              child: TabBarView(children: <Widget>[
                _createBody(),
              ]),
            )
          ],
        ));
  }

  Widget _createBody(){
    List<Widget> items = [];
    for(int i=0;i<dataList.length;i++){
      items.add(
        _createItem(dataList[i])
      );
    }

    items.insert(0, _createHeader());
    final listView = ListView(
      padding: EdgeInsets.only(top: 0),
      physics: AlwaysScrollableScrollPhysics(),
      children: items,
      controller: _scrollController,
    );

    return  RefreshIndicator(
      displacement: 20,
      onRefresh: _onRefresh,
      child: listView,
    );
  }

  Future<void> _onRefresh() async{
    await Future.delayed(Duration(seconds:1));

  }

  Widget _createHeader(){
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Image.asset("images/ic_notify_comments.png", width: 34, height: 34,),
                  Text("互动消息",style: TextStyle(fontSize: 12),)
                ],
              ),
              Column(
                children: <Widget>[
                  Image.asset("images/ic_notify_jewel.png", width: 34, height: 34,),
                  Text("简书钻",style: TextStyle(fontSize: 12))
                ],
              ),
              Column(
                children: <Widget>[
                  Image.asset("images/ic_notify_more.png", width: 34, height: 34,),
                  Text("其他提醒",style: TextStyle(fontSize: 12))
                ],
              )
            ],
          ),
          SizedBox(height: 30),
          Container(
            color: Color(0xffEBEBEB),
            height: 8,
          ),
          Container(
            padding: EdgeInsets.only(left: 14,top: 16,right: 14,bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("简信",style: TextStyle(fontSize: 14),),
                Text("新简信",style: TextStyle(fontSize: 14,color: Colors.deepOrange),)
              ],
            ),
          ),
        ],
      ),

    );
  }

  Widget _createItem(JXinMsg item) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(left: 14,right: 8),child: ClipOval(child: _getItemHead(item.headIcon,36,36),),),
          Flexible(
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(item.title,style: TextStyle(fontSize: 13),),
                  Padding(padding: EdgeInsets.only(left: 6),child: _getItemHead(item.flagIcon,18,18)),
                  Expanded(child: Container(child:Text(CommonUtil.formatDate(item.timeSec),style: TextStyle(fontSize: 10,color: Colors.black54)),alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 14),
                  ))
                ],
              ),
              Padding(padding: EdgeInsets.only(right: 14),
                  child:Text(item.summary,
                  style: TextStyle(fontSize: 10,color: Colors.black54),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )),
                  Padding(padding: EdgeInsets.only(top: 8,bottom: 8),child: Divider(),)
                ],
              )
          )
        ],
      ),
    );
  }


  Widget _getItemHead(String url,double widthItem,double heightItem){
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


  Widget _createTopBar() {
    return JiTopBar(
      textList: <String>[
        "消息"
      ],
      iconList: <String>[
        "images/ic_notify_settings.png",
        "images/ic_search.png"
      ],
      onPressed: (index){
        if(index == 0){
          _pushNotifySetting();
        }else{
          _pushSearch();
        }
      },
    );
  }

  void _pushSearch() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return Scaffold(
        body: Center(
          child: Text("search"),
        ),
      );
    }));
  }


  void _pushNotifySetting() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return Scaffold(
        body: Center(
          child: Text("notify setting"),
        ),
      );
    }));
  }


}