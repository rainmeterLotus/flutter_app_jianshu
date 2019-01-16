import 'package:flutter/material.dart';


typedef JiTopBarPressed<T> = void Function(T value);
class JiTopBar extends StatefulWidget{
  final List<String> textList;
  final List<String> iconList;
  final JiTopBarPressed<int> onPressed;

  JiTopBar({
    @required this.textList,
    this.iconList,
    this.onPressed
  });


  @override
  State<StatefulWidget> createState() {
    return _JiTopBarState();
  }

}

class _JiTopBarState extends State<JiTopBar>{
  @override
  Widget build(BuildContext context) {
    return _createTopBar(context);
  }




  Widget _createTopBar(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    List<Widget> tabList = <Widget>[];
    for(int i =0;i<widget.textList.length;i ++){
      tabList.add(Tab(child: Text(widget.textList[i],style: TextStyle(fontSize: 16),),));
    }

    List<Widget> iconBtnList = <Widget>[];

    for(int i =0;i<widget.iconList.length;i ++){
      iconBtnList.add(IconButton(
          padding: EdgeInsets.only(right: 8),
          icon: Image.asset(widget.iconList[i], width: 22, height: 22,
          ),
          onPressed: () {
            if(widget.onPressed != null){
              widget.onPressed(i);
            }
          }));
    }

    var indicatorColor = Color(0xffF28A71);
    if(widget.textList.length == 1 &&  widget.textList[0] == ""){
      indicatorColor = Colors.transparent;
    }


    return Container(
      padding: EdgeInsets.only(top: statusBarHeight),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: TabBar(
                    indicatorWeight: 2,
                    isScrollable: true,
                    labelColor: Color(0xffE05232),
                    unselectedLabelColor: Colors.black87,
                    indicatorColor: indicatorColor,
                    tabs: tabList),
              ),
              Expanded(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: iconBtnList,
                  ),
                ),
              )
            ],
          ),
          Divider(
            height: 1,
            color: Colors.black12,
          )
        ],
      ),
    );
  }
}