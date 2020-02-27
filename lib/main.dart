import 'package:flutter/material.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:today_mobile/pages/todo.dart';


import './pages/test_page.dart';
import './pages/home.dart';
import './pages/my.dart';

import 'config/app_config.dart';
import 'pages/login.dart';

void main() async {
    LeanCloud.initialize(AppConfig.appId, AppConfig.appKey, server: AppConfig.server,queryCache: LCQueryCache());
    runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'today mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute:(RouteSettings settings){
        print('routing');

        return MaterialPageRoute(builder: (context){
            String routeName = settings.name;
              print(routeName);
            }
        );
      },
      initialRoute:'/',
      //注册路由表
      routes:{
        "/":(context) => MainPage(title: 'Today'),
        "login":(context) =>  LoginPage(title: 'Login'),
        "todo":(context) =>  TodoPage(),
      } ,
    );
  }
}



class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);
  
  final String title;
  

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 1;

  void _checkLogin() async {
     LCUser user = await LCUser.getCurrent();
     if(user==null){
        print('not login');
        Navigator.pushReplacementNamed(context,'login');
     }else{
       print('login_user:'+user.username);
     }
  }

  _loginout () async {
     await LCUser.logout();
     print('login out !');
     LCUser user = await LCUser.getCurrent();
     print(user.username);
  }
  
  List<StatefulWidget> pageList = [
    HomePage(),
    TestPage(),
    MyPage(),
  ];

 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkLogin();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
           IconButton(
             icon: Icon(Icons.pause_circle_outline),
              onPressed: _loginout
            )
        ],
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
