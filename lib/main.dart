import 'package:flutter/material.dart';
import 'package:gdsc_sch_teama_project/mainpage.dart';
import 'package:gdsc_sch_teama_project/testp.dart';
import 'view_mywriting.dart';
import 'view_myparticipation.dart';
import 'mainpage.dart';
import 'testp.dart';
import 'package:flutter/cupertino.dart';
import 'getMediaQuery.dart';
import 'package:flutter/material.dart';

// 각 페이지들 import
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // 화면 이동 버튼, 새로운 페이지 만들때마다 복사해서 사용

              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => view_mywriting()));
                  },
                  child: Text("view_mywriting")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => view_myparticipation()));
                  },
                  child: Text("view_myparticipation")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => main_page()));
                  },
                  child: Text("main page")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => testp()));
                  },
                  child: Text("testp")),
            ],
          ),
        ),
      );
}
