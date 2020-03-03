

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

   void _toggleTodo(int index) async {
      Todo todo = _todos[index];
      todo['completed'] = ! todo['completed'];
      LCObject res = await todo.save();
      if(res!=null){
        setState(() {
          _todos[index]['completed'] = todo['completed'];
        });
      }
   }
   void _deleteTodo(int index) async{
       Todo todo = _todos[index];
       var  res =  await todo.delete();
       if(res){
         print(todo['objectId']);
         setState(() {
           _todos.remove(todo);
         });
       }
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
                 height:42,
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
           height: 400,
           width: double.infinity,
           child: ListView.builder(
             itemCount: _todos.length,
             itemBuilder: (context,index){
               final todo = _todos[index];
               return ListTile(
                 leading: Icon(todo['completed']? Icons.check_box:Icons.check_box_outline_blank),
                 title: Text(todo['desc']),
                 onTap: (){
                   _toggleTodo(index);
                 },
                 onLongPress: (){
                      _deleteTodo(index);
                 },
                );
             },
           ),
         ),
        
       ],
    );
  }
}