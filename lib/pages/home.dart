

import 'package:flutter/material.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:today_mobile/models/todo.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> _todos = [];
  final TextEditingController _todoCtrl= TextEditingController();
  String _desc = '';


   void _getTodos() async {
      LCObject.registerSubclass<Todo>('Todo', () => new Todo(''));
    LCQuery<Todo> lcq = LCQuery<Todo>('Todo');
     List<Todo> list = await lcq.find();
     setState(() {
       _todos = list;
     });
   }
   void _addTodo() async {
       print(this._todoCtrl.text);
        Todo todo = new Todo('');
      todo['desc'] = _desc;
      todo['completed'] = false;
      await todo.save();
      _todoCtrl.clear();
      print('add todo success ');
      this._getTodos();
   }

  @override void initState()  {
    super.initState();
  }
  @override void dispose() {
    _todoCtrl.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    this._getTodos();
    return Column(
       children: <Widget>[
         Container(
           child: Row(

             children: <Widget>[
               Container(
                 width: 300,
                 child: TextField(
                  
                    onChanged: (value){
                       setState(() {
                         _desc = value;
                       });
                    },
                    controller: _todoCtrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                 ),
               ),
               FlatButton(
                 color: Colors.deepPurple,
                 textColor: Colors.white,
                 onPressed: _addTodo,
                 child: Text('Add'))
             ],
           ),
         ),
         
         Container(
           color: Colors.cyanAccent,
           height: 100,
           width: double.infinity,
           child: ListView.builder(
             itemCount: _todos.length,
             itemBuilder: (context,index){
               final todo = _todos[index];
               return ListTile(
                 title: Text(todo['desc']),
                 subtitle: Text(todo.completed.toString()),
               );
             },
           ),
         ),
         Container(
           child: RaisedButton(
             child: Text('GET TODOS'),
             onPressed:_getTodos
            ),
         )
       ],
    );
  }
}