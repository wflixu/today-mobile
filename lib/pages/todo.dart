import 'package:flutter/material.dart';
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
            RaisedButton(
              child: Text('add todo'),
              onPressed: () {
                 print('tssss');
                 _addTodo();
               },
            )
          ]
        )
      ),
    );
  }
}