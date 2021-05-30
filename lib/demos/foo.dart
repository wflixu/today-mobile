
import 'package:flutter/material.dart';

class Foo extends StatefulWidget {
  @override
  _FooState createState() => _FooState();
}

class _FooState extends State<Foo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('foo'),
      ),
    );
  }
}