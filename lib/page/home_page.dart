import 'package:flutter/material.dart';
import 'package:flutter_app/data/home_page_data.dart';
import 'package:flutter_app/data/model/home_re.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_app/util/toast.dart';
import 'package:flutter_app/view/ji_top_bar.dart';


class JiHomePage extends StatefulWidget {
  @override
  _JiHomePageState createState() {
    // TODO: implement createState
    return _JiHomePageState();
  }
}

class _JiHomePageState extends State<JiHomePage> {
  List<HomeRe> dataList = [];
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    loadData();
    _scrollController.addListener((){
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _onMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 4,
        child: Column(
          children: <Widget>[
            _createTopBar(),
            Expanded(
              child: TabBarView(children: <Widget>[
                _createBody(),
                Center(
                  child: Text("专题"),
                ),
                Center(
                  child: Text("连载"),
                ),
                Center(
                  child: Text("会员"),
                ),
              ]),
            )
          ],
        ));
  }

  Widget _getSummary(String summary) {
    TextStyle summaryStyle = TextStyle(fontSize: 14, color: Colors.black54);
    return Text(summary,
        style: summaryStyle,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        textAlign: TextAlign.left);
  }
  Widget _getTitle(String title) {
    TextStyle titleStyle = TextStyle(fontSize: 20, color: Colors.black87);
    return Text(title,
        style: titleStyle,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        textAlign: TextAlign.left);
  }
  
  Widget _getBottom(HomeRe it){
    TextStyle bottomStyle = TextStyle(fontSize: 11, color: Colors.black54);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(padding: EdgeInsets.only(right: 4),child: Text(it.author, style: bottomStyle)),
        Padding(padding: EdgeInsets.only(right: 4),child: Image.asset("images/ic_see_num.png", width: 12, height: 12,)),
        Padding(padding: EdgeInsets.only(right: 4),child: Text(it.seeNum.toString(), style: bottomStyle,)),
        Padding(padding: EdgeInsets.only(right: 4),child: Image.asset("images/ic_discuss_num.png", width: 12, height: 12,)),
        Padding(padding: EdgeInsets.only(right: 4),child: Text(it.discussNum.toString(), style: bottomStyle,)),
        Padding(padding: EdgeInsets.only(right: 4),child: Image.asset("images/ic_like_num.png", width: 12, height: 12,)),
        Padding(padding: EdgeInsets.only(right: 4),child: Text(it.likeNum.toString(), style: bottomStyle,))
      ],
    );
  }

  Widget _getItemImage(String url,double widthItem,double heightItem){
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

  Widget _createBody() {

    EdgeInsets paddingAll = EdgeInsets.all(16);
    final items = dataList.map((it) {
      var bottomWidget = _getBottom(it);

      if (it.bigBannerUrl.isNotEmpty) {
        return Container(
          padding: paddingAll,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints.expand(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * 0.5),
                child: _getItemImage(it.bigBannerUrl,MediaQuery.of(context).size.width,MediaQuery.of(context).size.width * 0.5),
              ),
              Padding(padding: EdgeInsets.only(top: 8),child: _getTitle(it.title)),
              Padding(padding: EdgeInsets.only(top: 8,bottom: 12),child: _getSummary(it.summary)),
              bottomWidget,
            ],
          ),
        );
      } else if (it.listImg.length == 3) {
        var widthItem = MediaQuery.of(context).size.width * 0.3;
        var heightItem = widthItem * 0.8;
        return Container(
          padding: paddingAll,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(bottom: 8),child: _getTitle(it.title)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: ClipRRect(
                        child: _getItemImage(it.listImg[0], widthItem, heightItem),
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    flex: 1,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: ClipRRect(
                        child: _getItemImage(it.listImg[1], widthItem, heightItem),
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    flex: 1,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: ClipRRect(
                        child: _getItemImage(it.listImg[2], widthItem, heightItem),
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    flex: 1,
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              bottomWidget,
            ],
          ),
        );
      } else if (it.listImg.length == 1) {
        var widthItem = MediaQuery.of(context).size.width * 0.2;
        var heightItem = widthItem;
        return Container(
          padding: paddingAll,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(bottom: 4),child: _getTitle(it.title)),
                          _getSummary(it.summary)
                        ],
                  )),
                  Padding(padding: EdgeInsets.only(left: 10),child: ClipRRect(

                      child: _getItemImage(it.listImg[0], widthItem, heightItem),
                      borderRadius: BorderRadius.all(Radius.circular(4))),),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              bottomWidget,
            ],
          ),
        );
      }

      return Container(
        padding: paddingAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _getTitle(it.title),
            Padding(padding: EdgeInsets.only(top: 8,bottom: 8),child: _getSummary(it.summary)),
            bottomWidget,
          ],
        ),
      );
    });

    final div = ListTile.divideTiles(
      context: context,
      tiles: items,
    ).toList();

    final listView = ListView(
      /**
       * 这里padding Top=0，是因为 _createTopBar()方法设置了 statusBarHeight
       * ListView会自动会判断padding == null时，自动设置padding top值为
       * statusBarHeight
       */
      padding: EdgeInsets.only(top: 0),
      physics: BouncingScrollPhysics(),
      children: div,
      controller: _scrollController,
    );

    return RefreshIndicator(
      displacement: 20,
      onRefresh: _onRefresh,
      child: listView,
    );
  }


  Widget _createTopBar() {

    return JiTopBar(
      textList: <String>[
        "推荐","专题","连载","会员"
      ],
      iconList: <String>[
        "images/ic_search.png"
      ],
      onPressed: (index){
        _pushSearch();
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

  loadData() async {
    List<HomeRe> dataList = await HomePageDataExecutor.generalHomePage();
    setState(() {
      this.dataList = dataList;
    });
  }

  int refreshCount = 0;
  Future<void> _onRefresh() async{
    await Future.delayed(Duration(seconds:1));
    List<HomeRe> dataList = await HomePageDataExecutor.refreshHomPage(refreshCount);
    if(dataList == null || dataList.isEmpty){
      ToastUtil.show("It's up to date");
    }else{
      refreshCount += dataList.length;
      setState(() {
        this.dataList.insertAll(0, dataList);
      });
    }

  }

  int moreCount = 0;
  Future<void> _onMore() async{
    await Future.delayed(Duration(seconds:1));
    List<HomeRe> dataList = await HomePageDataExecutor.moreHomPage(moreCount);
    if(dataList == null || dataList.isEmpty){
      ToastUtil.show("It's no more");
    }else{
      moreCount += dataList.length;
      setState(() {
        this.dataList.addAll(dataList);
      });
    }
  }
}
