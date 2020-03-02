import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:today_mobile/models/todo.dart';

class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  void _addTodo ()  async{
      Todo todo = new Todo('');
      print(todo.desc);
      todo['desc'] = 'test haha';
      todo['completed'] = false;
      await todo.save();
      print('add todo success ');
  }
  void _getTodos() async{
    LCObject.registerSubclass<Todo>('Todo', () => new Todo(''));
    LCQuery<Todo> lcq = LCQuery<Todo>('Todo');
    List<Todo> list = await lcq.find();
     list.forEach((todo){
          print(todo['desc']);    
     });    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('todo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[

              ]
            ),
            RaisedButton(
              child: Text('get TODO'),
              onPressed:_getTodos
            )
          ]
        )
      ),
    );
  }
}