
import 'package:flutter/material.dart';
import 'package:today_mobile/widgets/page_content.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageContent(name:'登录')
    );
  }
}