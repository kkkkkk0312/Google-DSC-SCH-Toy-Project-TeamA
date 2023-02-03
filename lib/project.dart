import 'package:flutter/material.dart';
import 'package:gdsc_sch_teama_project/mainpage.dart';
import 'package:gdsc_sch_teama_project/view_myparticipation.dart';
import 'package:gdsc_sch_teama_project/view_mywriting.dart';
import 'dart:math';
import 'package:get/get.dart';

List<String> lists = [];
String s = '';

class project extends StatelessWidget {
  const project({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false, //앱 상단에 debug 표시 삭제
        title: 'project', //앱 이름
        theme: ThemeData(
            // 특정 색을 음영으로 가짐
            primarySwatch: Colors.grey),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //여러가지를 배치하다.
      appBar: AppBar(
          title: Text('POSTS'),
          centerTitle: true,
          backgroundColor: Colors.white24),

      body: Center(
        child: Column(children: [
          SizedBox(height: 40),
          ElevatedButton(
              child: Text("게시물 작성"),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Writing(),
                  ))),
          Expanded(
            child: ListView.separated(
              itemCount: lists.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    s = lists[index];
                    print('$s');
                    Get.to(Writing());
                  },
                  title: Text(lists[index]),
                  leading: Text('-'),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          ),
        ]),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text('HANEUL LEE'),
                accountEmail: Text("haneul@naver.com")),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => main_page(),
                    ));
              },
            ),
            ListTile(
              title: const Text('Posts'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ));
              },
            ),
            ListTile(
              title: const Text('Participate'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => view_myparticipation(),
                    ));
              },
            ),
            ListTile(
              title: const Text('MY'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => view_mywriting(),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Writing extends StatefulWidget {
  const Writing({Key? key}) : super(key: key);

  @override
  State<Writing> createState() => WritingState();
}

class WritingState extends State<Writing> {
  int count = 0;
  String sav = "not";
  TextEditingController title = TextEditingController(text: '$s');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  //Get.to(MyHomePage());
                },
                child: Text("참여 인원 보기"),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: TextField(
              controller: title,
              decoration: InputDecoration(
                  labelText: 'title',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  contentPadding: EdgeInsets.all(10)),
              onChanged: (text) {
                //onChanged를 이용하여 값 저장
                setState(() {
                  sav = text;
                });
              },
            ),
          ),
          SizedBox(height: 20),
          Row(children: [
            Text('작성자 : haneul'), // 작성자 닉네임
            SizedBox(width: 30),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.people),
            ),
            Text('$count/5'),
          ]),
          Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 5), //상하좌우 여백
            // 내용이 많으면 깨지니까 깨짐 방지
            child: SingleChildScrollView(
              // 11줄 이상 내용이 기재되어도 출력가능
              child: TextFormField(
                maxLines: 10,
                decoration: InputDecoration(
                  labelText: 'contents',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0)),
                ),
              ),
            ),
          ),
          Row(children: [
            ElevatedButton(
              onPressed: () {
                lists.add('$sav');
                Get.to(MyHomePage());
              },
              child: Text("등록"),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  count++;
                });
                // Get.to(MyHomePage());
              },
              child: Text("참여"),
            ),
            SizedBox(width: 10), //사이 띄우기
            ElevatedButton(
              onPressed: () {
                Get.to(Updating());
              },
              child: Text("수정"),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                print('$sav');
                lists.remove('$s');
                Get.to(MyHomePage());
              },
              child: Text("삭제"),
            ),
          ]),
        ],
      ),
    );
  }
}

class Updating extends StatelessWidget {
  //수정 Page
  const Updating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Text('제목'),
          Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: TextField(
              decoration: InputDecoration(
                  labelText: 'title',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(10)),
            ),
          ),
          SizedBox(height: 20),
          Text('작성자 : haneul'),
          Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 5), //상하좌우 여백
            // 내용이 많으면 깨지니까 깨짐 방지
            child: SingleChildScrollView(
              // 11줄 이상 내용이 기재되어도 출력가능
              child: TextFormField(
                maxLines: 10,
                decoration: InputDecoration(
                  labelText: 'contents',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Row(children: [
            ElevatedButton(
              onPressed: () {
                Get.to(MyHomePage());
              },
              child: Text("등록"),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                Get.off(MyHomePage());
              },
              child: Text("참여"),
            ),
            SizedBox(width: 10), //사이 띄우기
            ElevatedButton(
              onPressed: () {
                Get.to(Updating());
              },
              child: Text("수정"),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                Get.off(MyHomePage());
              },
              child: Text("삭제"),
            ),
          ]),
        ],
      ),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //여러가지를 배치하다.
      appBar: AppBar(
          title: Text('MY'),
          centerTitle: true,
          backgroundColor: Colors.white24),

      body: const Center(
        child: Text('MY Page!'),
      ),
    );
  }
}
