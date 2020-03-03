import 'package:flutter/material.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:today_mobile/pages/todo.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameCtrl = new TextEditingController();
  TextEditingController _passwordCtrl = new TextEditingController();
  GlobalKey<FormState> _loginKey = new GlobalKey<FormState>();



  void _login() async {
    
    print('start login');
    var loginForm = _loginKey.currentState;
    if(loginForm.validate()){
       LCUser user = await LCUser.login(_usernameCtrl.text, _passwordCtrl.text);
       print(user.username);
       print(user.sessionToken);
       Navigator.pushReplacementNamed(context, '/');
    }else{

    }
    
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
                key: _loginKey,
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
                      validator: (value){
                         return value.length < 3 ? "密码长度不够3位" : null;
                      },
                      controller: _passwordCtrl,
                   )
                 ] 
               ),
              ),
              SizedBox(
                 width:340.0,
                 height:42.0,
                 child: RaisedButton(
                     color: Colors.blueAccent,
                     onPressed: () {
                        _login();
              
                    },
                     textColor: Colors.white,
                     child: Text(
                       "登录",
                       style: TextStyle(
                         fontSize: 18.0
                       ),
                     ),

                   )
                 
              ),
          ],
        ),
      ),
    );
  }
}
