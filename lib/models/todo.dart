import 'package:leancloud_storage/leancloud.dart';

class Todo extends LCObject{
  static const String ClassName = 'Todo';
  String desc;
  bool completed;
  Todo(String desc):super(Todo.ClassName){
    this.desc = desc;
    this.completed = false;
  }
}