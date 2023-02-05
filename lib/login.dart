import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gdsc_sch_teama_project/project.dart';
import 'Next_Page.dart';
import 'SignUp.dart';
import 'mainpage.dart';
import 'Basefile.dart';
import 'package:dio/dio.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Let\'s Study Together',
      home: SignIn(),
    );
  }
}

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  final _fileName = 'idpw.txt';
  late String _path;
  bool isLoding = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign In'),
          backgroundColor: Colors.grey,
          centerTitle: true,
          // leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          // actions: <Widget>[
          //   IconButton(icon: Icon(Icons.search), onPressed: () {})
          // ],
        ),
        body: Builder(
          builder: (context) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 50)),
                  Center(
                    child: Image(
                      image: AssetImage('assets/img/GDSC.png'),
                      width: 100.0,
                      height: 100.0,
                    ),
                  ),
                  Form(
                      child: Theme(
                          data: ThemeData(
                              primaryColor: Colors.teal,
                              inputDecorationTheme: InputDecorationTheme(
                                  labelStyle: TextStyle(
                                      color: Colors.grey, fontSize: 15.0))),
                          child: Container(
                            padding: EdgeInsets.all(40.0),
                            child: Column(
                              children: <Widget>[
                                TextField(
                                  controller: emController,
                                  decoration:
                                      InputDecoration(labelText: 'Email'),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                TextField(
                                  controller: pwController,
                                  decoration:
                                      InputDecoration(labelText: 'Password'),
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                ),
                                SizedBox(
                                  height: 40.0,
                                ),
                                ButtonTheme(
                                    minWidth: 100.0,
                                    height: 50.0,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.grey,
                                          onPrimary: Colors.white,
                                        ),
                                        child: Icon(
                                          Icons.login_outlined,
                                          color: Colors.white,
                                          size: 35.0,
                                        ),
                                        onPressed: () async {
                                          if (await login(emController.text,
                                                  pwController.text) ==
                                              0) {
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        project()),
                                                (route) => false);
                                          } else {
                                            Fluttertoast.showToast(
                                                msg: "아이디 또는 비밀번호가 올바르지 않습니다.");
                                          }
                                        })),
                                TextButton(
                                  child: Text('계정이 없으신가요?'), // 글자
                                  style: TextButton.styleFrom(
                                    textStyle: TextStyle(
                                      fontSize: 18, // 글자 크기
                                    ),
                                    primary: Colors.grey, // 지정색
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                SignUp()));
                                  },
                                )
                              ],
                            ),
                          )))
                ],
              ),
            );
          },
        ));
  }

  void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('로그인이나 비밀번호 정보를 다시 확인하세요.'),
        duration: const Duration(seconds: 1),
        action: SnackBarAction(
          label: 'retry',
          onPressed: () {},
        )));
  }

  /// 로그인 메소드
  Future<int> login(String em, String pw) async {
    String postURI = hostURI + 'user/login';
    Map body = {
      'username': em,
      'password': pw,
    };
    Dio dio = Dio();
    try {
      print(body);
      var response = await dio.post(postURI, data: body);
      token = response.data['accessToken'];
      refreshToken = response.data['refreshToken'];
      my_email = emController.text;
      my_name = response.data['name'];
      await writeFile("$em\n$pw");
      print("sucess Login");
      return 0;
    } catch (e) {
      print("loginErr");
      print(e);
      return -1;
    }
  }

  /// 파일 읽기
  Future<String> readFile() async {
    try {
      final file = File('$_path/$_fileName');
      return file.readAsString();
    } catch (e) {
      return e.toString();
    }
  }

  /// 파일 쓰기
  Future<void> writeFile(String message) async {
    try {
      final file = File('$_path/$_fileName');
      file.writeAsString(message);
    } catch (e) {
      print(e);
    }
  }
}
