
import 'package:flutter/material.dart';
import 'package:today_mobile/demos/draw_page.dart';

import 'login.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
          ],
        ),
    );
  }
}