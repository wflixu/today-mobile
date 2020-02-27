
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:today_mobile/demos/draw_page.dart';

import 'login.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  _setvalue () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int counter = (prefs.getInt('counter') ?? 0) + 1;
       print('Pressed $counter times.');
       await prefs.setInt('counter', counter);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height:40.0,
              child: Text('')
            ),
            RaisedButton(
               onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage(title: 'login',)),
                  );
               },
                child: Text('Go login!'),
            ),
            RaisedButton(
               onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DrawPage()),
                  );
               },
                child: Text('go draw'),
            ),
            RaisedButton(
               onPressed: _setvalue,
                child: Text('SharedPreferences count'),
            ),
            RaisedButton(
               onPressed: () {
                  Navigator.pushNamed(context, 'todo');
               },
                child: Text('go todo'),
            ),
          ],
        ),
    );
  }
}