import 'package:flutter/material.dart';
import 'package:flutter_app/view/ji_top_bar.dart';

class JiFocusPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _JiFocusPageState();
  }
}

class _JiFocusPageState extends State<JiFocusPage>{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: Column(
          children: <Widget>[
            _createTopBar(),
            Expanded(
              child: TabBarView(children: <Widget>[
                Center(
                  child: Text("关注"),
                ),

              ]),
            )
          ],
        ));
  }

  Widget _createTopBar() {
    return JiTopBar(
      textList: <String>[
        "关注"
      ],
      iconList: <String>[
        "images/ic_add_man.png",
        "images/ic_search.png"
      ],
      onPressed: (index){
        if(index == 0){
          _pushAddAttention();
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


  void _pushAddAttention() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return Scaffold(
        body: Center(
          child: Text("Attention"),
        ),
      );
    }));
  }

}
