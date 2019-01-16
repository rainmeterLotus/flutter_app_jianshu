import 'package:flutter/material.dart';
class Test6 extends StatefulWidget {
  @override
  Test6State createState() {
    return new Test6State();
  }
}

class Test6State extends State<Test6> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    List<int> pages = [1, 2, 3, 4];
    List<int> data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    return Scaffold(
      appBar: AppBar(),
      body: PageView(
        children: pages.map((i) {
          return Container(
            height: double.infinity,
            color: Colors.red,
            child: Test6Page(i, data),
          );
        }).toList(),
        controller: _pageController,
      ),
    );
  }
}

class Test6Page extends StatefulWidget {
  final int pageIndex;
  final List<int> data;

  Test6Page(this.pageIndex, this.data);

  @override
  _Test6PageState createState() => _Test6PageState();
}

class _Test6PageState extends State<Test6Page> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    print('initState');
  }

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: widget.data.map((n) {
        return ListTile(
          title: Text("第${widget.pageIndex}页的第$n个条目"),
        );
      }).toList(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}