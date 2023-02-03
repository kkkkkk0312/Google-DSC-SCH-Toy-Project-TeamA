import 'package:flutter/material.dart';
import 'main.dart';
import 'Login.dart';

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
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  bool _isChecked = false;
  List<String?> checkListValue = [];
  List<String> checkList = ["Backend", "Frontend", "ML", "APP", "Etc"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
          backgroundColor: Colors.redAccent,
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
                                  decoration:
                                      InputDecoration(labelText: 'Email'),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                TextField(
                                  controller: controller,
                                  decoration:
                                      InputDecoration(labelText: 'Password'),
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                ),
                                TextField(
                                  controller: controller2,
                                  decoration: InputDecoration(
                                      labelText: 'Retry Password'),
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                ),
                                TextField(
                                  decoration:
                                      InputDecoration(labelText: 'Name'),
                                  keyboardType: TextInputType.text,
                                ),
                                TextField(
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
                                          primary: Colors.orangeAccent,
                                          onPrimary: Colors.white,
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 35.0,
                                        ),
                                        onPressed: () {
                                          if (controller.text ==
                                              controller2.text) {
                                            showSnackBar(context);
                                          } else if (controller.text !=
                                              controller2.text) {
                                            showSnackBar2(context);
                                          }
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
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                          Text('Etc'),
                                          Checkbox(
                                            value: _isChecked, //처음엔 false
                                            onChanged: (value) {
                                              //value가 false -> 클릭하면 true로 변경됨(두개 중 하나니까)
                                              setState(() {
                                                _isChecked =
                                                    value!; //true가 들어감.
                                                if (_isChecked == 'true') {
                                                  TextField(
                                                    decoration: InputDecoration(
                                                        labelText: '어쩔'),
                                                    keyboardType:
                                                        TextInputType.text,
                                                  );
                                                }
                                              });
                                            },
                                          ),
                                        ])))
                              ]))))
                ],
              ),
            );
          },
        ));
  }
}

class _checkbox extends State<SignUp> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          Checkbox(
            checkColor: Colors.white,
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}

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
