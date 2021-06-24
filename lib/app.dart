import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'pages/home/index.dart';
import './routes.dart';


class App extends StatefulWidget {
  const App({ Key? key }) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  
  @override
  Widget build(BuildContext context) {
     final router = FluroRouter();
    Routes.configureRoutes(router);
    return  MaterialApp(
       title: 'Today',
      // home: LoginPage(),
      onGenerateRoute: router.generator,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
    
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Today',
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // routes: {
      //   'foo':(context)=> Foo(),
      //   'bar':(context)=> Bar(text:'bar'),
      //   '/':(context)=> MyHomePage(title: 'Flutter Demo Home Page')
      // },
      // onGenerateRoute: (RouteSettings settings) {
      //   return MaterialPageRoute(builder: (context){
      //   var routeName = settings.name;
      //   print(routeName);
      //   return Bar(text: 'login ');
      //   });
      // },
  
    );
  }
}