import 'package:leancloud_storage/leancloud.dart';

class Todo extends LCObject{
  static const String ClassName = 'Todo';
  String desc;
  bool completed;
  Todo(String desc):super('Todo'){
    this.desc = desc;
    this.completed = false;
  }
  Map toJson() {
    Map map = new Map();
    map["desc"] = this.desc;
    map["completed"] = this.completed;
    return map;
  }
}