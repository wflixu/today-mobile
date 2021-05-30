import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  
  Bar({ required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('bar'),
      ),
      body: Center(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
            Text('lis-1'),
            Text(text)
          ]
        ),
      ),
    );
  }
}

// class Bar extends StatefulWidget {
//   final String text;

//   Bar({Key:key,required this.text}):super(key:key)

//   // ignore: empty_constructor_bodies
//   @override
//   _BarState createState() => _BarState();
// }

// class _BarState extends State<Bar> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('bar'),
//       ),
//       body: Center(
//         child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//           children:<Widget>[
//             Text('lis-1')
//           ]
//         ),
//       ),
//     );
//   }
// }