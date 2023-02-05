import 'package:flutter/material.dart';
import 'Login.dart';
import 'Basefile.dart';
import 'package:dio/dio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Let\'s Study Together',
      home: SignUp(),
    );
  }
}

class SignUp extends StatefulWidget {
  //확인 요망
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var dio = Dio();
  TextEditingController emController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController pwcController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController tnumController = TextEditingController();

  bool _isChecked = false;
  List<String?> checkListValue = [];
  List<String> checkList = ["Backend", "Frontend", "ML", "APP", "Etc"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
          backgroundColor: Colors.grey,
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {})
          ],
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
                      width: 150.0,
                      height: 100.0,
                    ),
                  ),
                  Form(
                      child: Theme(
                          data: ThemeData(
                              primaryColor: Colors.teal,
                              inputDecorationTheme: InputDecorationTheme(
                                  labelStyle: TextStyle(
                                      color: Colors.teal, fontSize: 15.0))),
                          child: Container(
                              padding: EdgeInsets.all(40.0),
                              child: Column(children: <Widget>[
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
                                TextField(
                                  controller: pwcController,
                                  decoration: InputDecoration(
                                      labelText: 'Retry Password'),
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                ),
                                TextField(
                                  controller: nameController,
                                  decoration:
                                      InputDecoration(labelText: 'Name'),
                                  keyboardType: TextInputType.text,
                                ),
                                TextField(
                                  controller: tnumController,
                                  decoration: InputDecoration(
                                      labelText: 'Telephone Number'),
                                  keyboardType: TextInputType.text,
                                ),
                                SizedBox(
                                  height: 40.0,
                                ),
                                ButtonTheme(
                                    minWidth: 100.0,
                                    height: 50.0,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.redAccent,
                                          onPrimary: Colors.white,
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 35.0,
                                        ),
                                        onPressed: () async {
                                          if (await postSignUp(
                                                  emController.text,
                                                  pwController.text,
                                                  pwcController.text,
                                                  nameController.text,
                                                  tnumController.text) ==
                                              0) {
                                            showSnackBar(context);
                                          } else {
                                            showSnackBar2(context);
                                          }
                                          // if (pwController.text ==
                                          //     pwcController.text) {
                                          //       String postURI = hostURI + 'user/signup';
                                          //     Map body = {
                                          //       'email': emController.text,
                                          //       'password': pwController.text,
                                          //       'name': nameController.text,
                                          //       'phoneNum': tnumController.text,
                                          //       'part': eController.text,
                                          //     };
                                          //   showSnackBar(context);
                                          // } else if (pwController.text !=
                                          //     pwcController.text) {
                                          //   showSnackBar2(context);
                                          // }
                                        })),
                                //분야 체크 박스
                                Container(
                                  padding:
                                      EdgeInsets.only(left: 20.0, top: 20.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Field (Multiple selections available)",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0),
                                        ),
                                      ),
                                      Container(
                                        child: Column(
                                          children: this
                                              .checkList
                                              .map<Widget>((String v) =>
                                                  Container(
                                                    margin:
                                                        EdgeInsets.all(20.0),
                                                    child: CheckboxListTile(
                                                      onChanged: (bool? check) {
                                                        setState(() {
                                                          if (this
                                                                  .checkListValue
                                                                  .indexOf(v) >
                                                              -1) {
                                                            this
                                                                .checkListValue
                                                                .remove(v);
                                                            return;
                                                          }
                                                          this
                                                              .checkListValue
                                                              .add(v);
                                                          if (this.checkListValue ==
                                                              checkList[4]) {
                                                            TextField(
                                                              decoration:
                                                                  InputDecoration(
                                                                      labelText:
                                                                          'What?'),
                                                              keyboardType:
                                                                  TextInputType
                                                                      .text,
                                                            );
                                                          }
                                                        });
                                                      },
                                                      title: Text(v),
                                                      value: this
                                                                  .checkListValue
                                                                  .indexOf(v) >
                                                              -1
                                                          ? true
                                                          : false,
                                                    ),
                                                  ))
                                              .toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Padding(
                                //     padding: const EdgeInsets.all(8.0),
                                //     child: Center(
                                //         child: Column(
                                //             mainAxisAlignment:
                                //                 MainAxisAlignment.center,
                                //             children: <Widget>[
                                //           Text('Etc'),
                                //           Checkbox(
                                //             value: _isChecked, //처음엔 false
                                //             onChanged: (value) {
                                //               //value가 false -> 클릭하면 true로 변경됨(두개 중 하나니까)
                                //               setState(() {
                                //                 _isChecked =
                                //                     value!; //true가 들어감.
                                //                 if (_isChecked == 'true') {
                                //                   TextField(
                                //                     decoration: InputDecoration(
                                //                         labelText: '어쩔'),
                                //                     keyboardType:
                                //                         TextInputType.text,
                                //                   );
                                //                 }
                                //               });
                                //             },
                                //           ),
                                //         ])))
                                SizedBox(
                                  height: 40.0,
                                ),
                                ButtonTheme(
                                    minWidth: 100.0,
                                    height: 50.0,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.grey.shade700,
                                          onPrimary: Colors.white,
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 35.0,
                                        ),
                                        onPressed: () {
                                          if (pwController.text ==
                                              pwcController.text) {
                                            showSnackBar(context);
                                          } else if (pwController.text !=
                                              pwController.text) {
                                            showSnackBar2(context);
                                          }
                                        })),
                              ]))))
                ],
              ),
            );
          },
        ));
  }
}

// class _checkbox extends State<SignUp> {
//   bool isChecked = false;
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: <Widget>[
//           const SizedBox(
//             height: 30,
//           ),
//           Checkbox(
//             checkColor: Colors.white,
//             value: isChecked,
//             onChanged: (bool? value) {
//               setState(() {
//                 isChecked = value!;
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

void showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('회원가입이 완료되었습니다.'),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: 'Sign In',
        onPressed: () {
          Navigator.pop(
            context,
            MaterialPageRoute(builder: (BuildContext context) => SignIn()),
          );
        },
      )));
}

void showSnackBar2(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('비밀번호가 일치하지 않습니다.'),
      duration: const Duration(seconds: 1),
      action: SnackBarAction(
        label: 'retry',
        onPressed: () {},
      )));
}

Future<int> postSignUp(
    String em, String pw1, String pw2, String name, String tnum) async {
  if (pw1 != pw2) {
    return -1;
  }
  String postURI = hostURI + 'user/signup';
  Map body = {
    'email': em,
    'password': pw1,
    'name': name,
    'phoneNum': tnum,
  };
  Dio dio = Dio();
  try {
    var response = await dio.post(postURI, data: body);
    print('====================');
    print('sucess signUp');
    return 0;
  } catch (e) {
    print('====================');
    print('signUpErr');
    return -1;
  }
}
