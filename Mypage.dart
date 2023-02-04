import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_sch_teama_project/view_myparticipation.dart';
import 'package:gdsc_sch_teama_project/view_mywriting.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class Mypage extends StatelessWidget {
  const Mypage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false, //앱 상단에 debug 표시 삭제
        title: 'MY', //앱 이름
        theme: ThemeData(
            // 특정 색을 음영으로 가짐
            primarySwatch: Colors.grey),
        home: Mypage());
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //여러가지를 배치하다.
      appBar: AppBar(
          title: Text('MY'), centerTitle: true, backgroundColor: Colors.grey),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.mail_outline_sharp),
              iconSize: 200,
            ),
            Text('ID',
                style: TextStyle(fontSize: 35)),
            SizedBox(height: 40),
            ElevatedButton(
                child: Text("참여한 프로젝트 보기",
                  style: TextStyle(fontSize: 15)),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => view_myparticipation()))),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text("작성 게시물 보기",
                style: TextStyle(fontSize: 15)),
              onPressed: () =>   Navigator.push(
                  context, MaterialPageRoute(builder: (_) => view_mywriting())),
              ),
          ],
        ),
      ),
    );
  }
}
