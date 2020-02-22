import 'package:flutter/material.dart';
import 'package:leancloud_storage/leancloud.dart';


import './pages/test_page.dart';
import './pages/home.dart';
import './pages/my.dart';

import 'config/app_config.dart';

void main() async {
    LeanCloud.initialize(AppConfig.appId, AppConfig.appKey, server: AppConfig.server,queryCache: LCQueryCache());
    print(new LCUser().username);
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'today mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Today'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 1;

  List<StatefulWidget> pageList = [
    HomePage(),
    TestPage(),
    MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: pageList[currentIndex],
 
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:Icon(Icons.home),
            title: Text('home')
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.pages),
            title: Text('test')
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.person),
            title: Text('my')
          ),
        ],
        currentIndex: currentIndex,
        onTap: (idx){
          setState(() {
             this.currentIndex = idx;
          });
          
        },
      ),
    );
  }
}
