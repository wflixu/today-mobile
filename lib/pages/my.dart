
import 'package:flutter/material.dart';


class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with SingleTickerProviderStateMixin{
  List _tabs = ['作品','喜欢'];
  
  TabController _tabCtrl ;

  @override
  void initState() {
    super.initState();
    this._tabCtrl = TabController(length: _tabs.length, vsync: this);

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.pink,
          child: TabBar(
             controller: _tabCtrl,
             tabs: _tabs.map(
               (tab)=>Tab(text:tab)
               ).toList(),
          )
          
        ),
        Container(
          height: 400,
          child: TabBarView(
            controller: _tabCtrl,
            children: _tabs.map((tab)=> Container(
              child: Text(tab+'content')
            )).toList()
          )

        )
      ]
    );
  }
}