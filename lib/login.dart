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
                                                msg: "????????? ?????? ??????????????? ???????????? ????????????.");
                                          }
                                        })),
                                TextButton(
                                  child: Text('????????? ????????????????'), // ??????
                                  style: TextButton.styleFrom(
                                    textStyle: TextStyle(
                                      fontSize: 18, // ?????? ??????
                                    ),
                                    primary: Colors.grey, // ?????????
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
        content: const Text('??????????????? ???????????? ????????? ?????? ???????????????.'),
        duration: const Duration(seconds: 1),
        action: SnackBarAction(
          label: 'retry',
          onPressed: () {},
        )));
  }

  /// ????????? ?????????
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

  /// ?????? ??????
  Future<String> readFile() async {
    try {
      final file = File('$_path/$_fileName');
      return file.readAsString();
    } catch (e) {
      return e.toString();
    }
  }

  /// ?????? ??????
  Future<void> writeFile(String message) async {
    try {
      final file = File('$_path/$_fileName');
      file.writeAsString(message);
    } catch (e) {
      print(e);
    }
  }
}
