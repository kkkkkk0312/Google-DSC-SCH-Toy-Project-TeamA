import 'package:flutter/material.dart';
import 'dart:math';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false, 
        title: 'project', 
        theme: ThemeData(
            primarySwatch: Colors.grey),
        home: MyHomepage());
  }
}

class MyHomepage extends StatelessWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('커뮤니티'), 
          centerTitle: true,
          backgroundColor: Colors.white24),

      body: Center(
        child: Column(children: [
          Text('Posts'),
          ElevatedButton(
              child: Text("게시물 작성"), 
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Writing(),
                  ))),
          Expanded(
            child: ListView.separated(
              itemCount: 3,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Get.to(posting(index));
                  },
                  title: Text("제목1"),
                  leading: Text('1'),
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
              title: const Text('Home(기능 X)'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Posts'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomepage(),
                    ));
              },
            ),
            ListTile(
              title: const Text('Developer'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('MY'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyPage(),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}


class Updating extends StatelessWidget { //수정 Page
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
          Text('내용'),
          Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 5), //상하좌우 여백
            child: Expanded(
              // 내용이 많으면 깨지니까 깨짐 방지
              child: SingleChildScrollView( // 11줄 이상 내용이 기재되어도 출력가능
                child: TextFormField(
                  maxLines: 10,
                  decoration: InputDecoration(
                    labelText: 'contents',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ),
          Row(children: [
            ElevatedButton(
              onPressed: () {
                Get.to(MyHomepage());
              },
                 },
              child: Text("등록"),
            ),

            ElevatedButton(
              onPressed: () {
                Get.to(MyHomepage());
              },
             },
              child: Text("참여"),
            ),

            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                Get.to(Updating());
              },
              child: Text("수정"),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                Get.off(MyHomepage());
              },
              },
              child: Text("삭제"),
            ),
          ]),
        ],
      ),
    );
  }
}

class Writing extends StatelessWidget {
  const Writing({Key? key}) : super(key: key);

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
          Text('내용'),
          Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 5), 
            child: Expanded(
           
              child: SingleChildScrollView( 
                child: TextFormField(
                  maxLines: 10,
                  decoration: InputDecoration(
                    labelText: 'contents',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ),
          Row(children: [
            ElevatedButton(
              onPressed: () {
                Get.off(MyHomepage());
              },
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
                Get.off(MyHomepage());
              },
                },
              child: Text("삭제"),
            ),
          ]),
        ],
      ),
    );
  }
}

class posting extends StatelessWidget {
  final int id;

  const posting(this.id); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Text("글 제목"),
            Row(children: [
              ElevatedButton(
                onPressed: () {
                  Get.off(MyHomepage());
                },
                },
                child: Text("참여"),
              ),

              SizedBox(width: 10), 
              ElevatedButton(
                onPressed: () {
                  Get.to(Updating());
                },
                child: Text("수정"),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  Get.off(MyHomepage());
                },
                   },
                child: Text("삭제"),
              ),
            ]),
            Expanded(

              child: SingleChildScrollView(
                child: Text("글 내용" * 50),
              ),
            ),
          ]),
        ));
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
