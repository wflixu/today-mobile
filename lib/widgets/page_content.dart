
import 'package:flutter/material.dart';

import '../routes.dart';

class PageContent extends StatelessWidget {
  final String name ;

  const PageContent({Key? key, required this.name}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('$name')),
      body: ListView(children: <Widget>[
        TextButton(onPressed: (){
          Navigator.pushNamed(context, Routes.home);
        }, 
         child: Text(Routes.home)
        ),
        TextButton(onPressed: (){
          Navigator.pushNamed(context, Routes.login);
        }, child: Text(Routes.login))
      ]),
    );
  }
}