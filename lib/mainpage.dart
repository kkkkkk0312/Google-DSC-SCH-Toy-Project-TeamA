import 'package:gdsc_sch_teama_project/project.dart';
import 'package:gdsc_sch_teama_project/view_myparticipation.dart';
import 'package:gdsc_sch_teama_project/view_mywriting.dart';
import 'package:gdsc_sch_teama_project/view_postdetail.dart';
import 'package:get/get.dart';
import 'Mypage.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Mypage.dart';
import 'getMediaQuery.dart';

List<String> lists = [];
String s = '';

class mainpage extends StatelessWidget {
  const mainpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false, //앱 상단에 debug 표시 삭제
        title: 'project', //앱 이름
        theme: ThemeData(
            // 특정 색을 음영으로 가짐
            primarySwatch: Colors.grey),
        home: main_page());
  }
}

class main_page extends StatefulWidget {
  const main_page({Key? key}) : super(key: key);

  @override
  State<main_page> createState() => _main_pageState();
}

class _main_pageState extends State<main_page> {
  var td = DateTime.now();

  final List<String> mytitle = <String>[
    'AI 개발할 팀원 구합니다.',
    '간단한 계시판 만들 팀원 구해요.',
    '같이 다이어리 어플 만드실 팀원 구합니다.',
    '앱 배포까지 함께갈 팀원 구해요.'
  ];
  final List<String> total_title = <String>[
    'AI 개발할 팀원 구합니다.',
    '모바일 보드게임 만드실 팀원 구합니다.',
    '함께 런닝 보조 어플 만들어 보실 분 구해요.',
    '초보여도 상관 없습니다. flutter 같이 공부하실 분 찾습니다.',
    '간단한 계시판 만들 팀원 구해요.',
    '같이 다이어리 어플 만드실 팀원 구합니다.',
    '앱 배포까지 함께갈 팀원 구해요.',
    '이번에 GDSC 해커톤 대회에 함께 나갈 동료 구합니다.',
    'GDSC KR WinterCup에 참여하고 싶은 사람을 모집합니다.',
    '트랜디한 팝업 스토어 어플을 만들고 있습니다.'
  ];
  final List<String> participate_title = <String>[
    'AI 개발할 팀원 구합니다.',
    '모바일 보드게임 만드실 팀원 구합니다.',
    '간단한 계시판 만들 팀원 구해요.',
    '같이 다이어리 어플 만드실 팀원 구합니다.',
    '앱 배포까지 함께갈 팀원 구해요.'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //여러가지를 배치하다.
      appBar: AppBar(
          title: Text(''), centerTitle: true, backgroundColor: Colors.white24),

      body: Container(
        child: Column(children: [
          SizedBox(height: 10),
          Text("POSTS",
              style: TextStyle(fontSize: 25), textAlign: TextAlign.left),
          SizedBox(height: 30),
          Text(
            td.month.toString() + "월 " + td.day.toString() + "일",
          ),
          ElevatedButton(
              child: Text("게시물 작성"),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Writing(),
                  ))),
          Expanded(
            child: ListView.separated(
              // scrollDirection: Axis.horizontal,
              itemCount: total_title.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => postdetail()));
                  },
                  title: Text(total_title[index]),
                  leading: Text('-'),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: lists.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    s = lists[index];
                    print('$s');
                    Get.to(postdetail());
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
                      builder: (context) => main_page(),
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
                      builder: (context) => Mypage(),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
