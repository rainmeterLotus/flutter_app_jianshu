import 'package:flutter/material.dart';


typedef JiBottomBarChanged<T> = void Function(T value,bool isPublish);

class JiBottomBar extends StatefulWidget {
  final List<JiBottomBarItem> items;
  final int currentIndex;
  final Color backgroundColor;
  final Color textFocusColor;
  final JiBottomBarChanged<int> onTap;

  JiBottomBar({
    @required this.items,
    this.currentIndex = 0,
    this.backgroundColor,
    this.textFocusColor,
    this.onTap,
  });

  @override
  _JiBottomBarState createState() {
    return _JiBottomBarState();
  }
}

class _JiBottomBarState extends State<JiBottomBar>{

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = <Widget>[];
    for (int i = 0; i < widget.items.length; i += 1) {
      children.add(_createItem(i));
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Divider(
          height: 1,
          color: Colors.black12,
        ),
        Container(
          color: widget.backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: children,
          ),
        )
      ],
    );
  }

  Widget _createItem(int i) {
    JiBottomBarItem item = widget.items[i];
    bool selected = i == widget.currentIndex;
    if(i>=2){
      selected = i == widget.currentIndex+1;
    }


    if(item.title == null){
      return Expanded(
          flex: 1,
          child: IconButton(icon: item.icon,
              padding: EdgeInsets.all(0),
              onPressed: (){
            if(widget.onTap != null){
              widget.onTap(-1,true);
            }
          }));
    }
    
    return Expanded(
        flex: 1,
        child: Container(
          padding: EdgeInsets.only(top: 4, bottom: 4),
          child: InkResponse(
            highlightColor: Colors.transparent,
            onTap: (){
              if(widget.onTap != null){
                widget.onTap(i= i<2 ?i:i-1,false);
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                selected ? item.activeIcon : item.icon,


                DefaultTextStyle.merge(
                    style: TextStyle(
                      fontSize: 10,
                      // ignore: ambiguous_import
                      color: selected ? widget.textFocusColor : Colors.black38,
                    ),
                    child: item.title),
              ],
            ),
          ),
        ));
  }
}

class JiBottomBarItem {
  final Widget icon;
  final Widget activeIcon;
  final Widget title;
  final bool isExtend;

  JiBottomBarItem({@required this.icon, this.title, this.activeIcon,this.isExtend})
      : assert(icon != null);
}
