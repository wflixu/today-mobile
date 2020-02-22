
import 'package:flutter/material.dart';

class DrawPage extends StatefulWidget {
  @override
  _DrawPageState createState() => _DrawPageState();
}

class _DrawPageState extends State<DrawPage> {

  GlobalKey<ScaffoldState> _globalKey = new GlobalKey();  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text('draw bar'),
        leading: IconButton(icon: Icon(Icons.apps) , onPressed: (){
           _globalKey.currentState.openDrawer();
        }),
      ),
      body: Column(
        children: <Widget>[
          Listener(
              onPointerDown: (e){
                print('point donw');
              },
              child: Container(
                height:100,
                width: 100,
                color: Colors.cyan
             ) 
          ),
          GestureDetector(
            onTap: (){
              print('tap tap tap tap ');
            },
            onLongPress: (){
              print('long press');
            },
            child: Container(
              height:100,
              width: 100,
              color: Colors.deepOrange
            ) 
          )
        ]
      ),
      drawer: Container(
        width: 300,
        color: Colors.purple
      ),
      
    );
  }
}