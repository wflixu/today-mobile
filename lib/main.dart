import 'package:flutter/material.dart';
import 'package:leancloud_storage/leancloud.dart';


import './pages/test_page.dart';
import './pages/home.dart';
import './pages/my.dart';

void main() async {
     LeanCloud.initialize('awgkVY8XvUY5oWtvmzRH6ylj-gzGzoHsz', 'GJnJ1a8KVnaVLquMKj6uSllD', server: 'https://awgkvy8x.lc-cn-n1-shared.com',queryCache: LCQueryCache());
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
