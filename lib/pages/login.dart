import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _counter = 0;
  TextEditingController _usernameCtrl = new TextEditingController();
  TextEditingController _passwordCtrl = new TextEditingController();
  GlobalKey  _formKey = new GlobalKey();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    _usernameCtrl.addListener((){
        print(_usernameCtrl.text);
    });
    _passwordCtrl.addListener((){

    });
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
             Form(
                key: _formKey,
                autovalidate: true,
                 child: Column(
                 children:<Widget>[
                   TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: '用户名',
                        hintText: '请输入用户名',
                        prefixIcon: Icon(Icons.assignment_ind)
                      ),
                      keyboardType: TextInputType.text,
                      controller: _usernameCtrl,
                      validator: (val){
                        return val.trim().length>0 ? null: '请输入用户名';
                      },
                   ),
                   TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: '密码',
                        hintText: '请输入密码',
                        prefixIcon: Icon(Icons.remove_red_eye)
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      controller: _passwordCtrl,
                   )
                 ] 
               ),
              ),
              MaterialButton(
                onPressed: () {
                   if((_formKey.currentState as FormState).validate()){
                      print('submit data');
                    }
                },
                child: Text("submit "),
                minWidth: double.infinity,
                height: 50.0,
                color: Colors.green,
                textColor: Colors.white,
              ),
          ],
        ),
      ),
    );
  }
}
