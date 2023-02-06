import 'package:gdsc_sch_teama_project/mainpage.dart';
import 'package:gdsc_sch_teama_project/Writing.dart';
import 'package:gdsc_sch_teama_project/view_postdetail.dart';

import 'Mypage.dart';
import 'login.dart';
import 'main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Basefile.dart';

class view_myparticipation extends StatelessWidget {
  double touchedPosX = 0;
  final List<String> mytitle = <String>[
    'AI 개발할 팀원 구합니다.',
    '간단한 게시판 만들 팀원 구해요.',
    '같이 다이어리 어플 만드실 팀원 구합니다.',
    '앱 배포까지 함께갈 팀원 구해요.'
  ];
  final List<String> total_title = <String>[
    'AI 개발할 팀원 구합니다.',
    '모바일 보드게임 만드실 팀원 구합니다.',
    '함께 런닝 보조 어플 만들어 보실 분 구해요.',
    '초보여도 상관 없습니다. flutter 같이 공부하실 분 찾습니다.',
    '간단한 게시판 만들 팀원 구해요.',
    '같이 다이어리 어플 만드실 팀원 구합니다.',
    '앱 배포까지 함께갈 팀원 구해요.'
  ];
  final List<String> participate_title = <String>[
    'AI 개발할 팀원 구합니다.',
    '모바일 보드게임 만드실 팀원 구합니다.',
    '간단한 게시판 만들 팀원 구해요.',
    '같이 다이어리 어플 만드실 팀원 구합니다.',
    '앱 배포까지 함께갈 팀원 구해요.'
  ];

  // 위젯간 간격(세로)
  double titleFontSize = 17;
  // 연회색
  int color_gray = 0xFFE9E9E9;
  // 찐노랑
  int color_realYellow = 0xFFFFD966;
  // 민트
  int color_mint = 0xFFCDF0EA;
  // 오늘 날짜
  var td = DateTime.now();

  @override
  Widget build(BuildContext context) => Container(
        // 상태바 높이만큼 띄우기
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Scaffold(
            //backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text('참여 중인 프로젝트'),
              backgroundColor: Colors.grey,
              centerTitle: true,
              // leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.logout),
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => SignIn()));
                    })
              ],
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  UserAccountsDrawerHeader(
                      accountName: Text(my_name), accountEmail: Text(my_email)),
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
            // Body
            body: GestureDetector(
              // onTap: () {},
              // on
              child: Container(
                  height: getMobileSizeFromPercent(context, 82, false) -
                      MediaQuery.of(context).padding.top * 2,
                  width: double.infinity,
                  // 여기서부터 찐 개발 시작
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // 제목
                      Column(
                        children: [
                          Text(
                              td.month.toString() +
                                  "월 " +
                                  td.day.toString() +
                                  "일",
                              style: TextStyle(fontSize: titleFontSize)),
                          Text("\내가 참여한 프로젝트 보기",
                              style: TextStyle(fontSize: titleFontSize)),
                          Container(
                            height: 5,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              //모서리를 둥글게 하기 위해 사용
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: Color(color_gray),
                            elevation: 0, // 그림자 깊이
                            child: Container(
                              padding: EdgeInsets.all(5),
                              width:
                                  getMobileSizeFromPercent(context, 80, true),
                              height:
                                  getMobileSizeFromPercent(context, 60, false),
                              child: ListView.builder(
                                // scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.all(10),
                                itemCount: participate_title.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    title: Text(
                                      participate_title[index],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => postdetail()));
                                    },
                                  );

                                  separatorBuilder:
                                  (BuildContext context, int index) {
                                    return Divider();
                                  };
                                },
                                // children: [
                                //   ListTile(
                                //     title: Text(
                                //       "AI 개발할 팀원 구합니다.",
                                //       maxLines: 1,
                                //       overflow: TextOverflow.ellipsis,
                                //       style: TextStyle(fontSize: 18),
                                //     ),
                                //     onTap: () {
                                //       Navigator.push(
                                //           context,
                                //           MaterialPageRoute(
                                //               builder: (_) => MyApp()));
                                //     },
                                //     trailing: IconButton(
                                //         onPressed: () {
                                //           showDialogPop(context,index);
                                //         },
                                //         icon: Icon(Icons.clear)),
                                //   ),
                                //   Divider(),
                                //   ListTile(
                                //     title: Text(
                                //       "간단한 계시판 만들 팀원 구해요.",
                                //       maxLines: 1,
                                //       overflow: TextOverflow.ellipsis,
                                //       style: TextStyle(fontSize: 18),
                                //     ),
                                //     onTap: () {
                                //       Navigator.push(
                                //           context,
                                //           MaterialPageRoute(
                                //               builder: (_) => MyApp()));
                                //     },
                                //     trailing: IconButton(
                                //         onPressed: () {
                                //               setState(() {
                                //               items.removeAt(index);
                                //             });
                                //         },
                                //         icon: Icon(Icons.clear)),
                                //   ),
                                //   Divider(),
                                //   ListTile(
                                //     title: Text(
                                //       "같이 다이어리 어플 만드실 팀원 구합니다.",
                                //       maxLines: 1,
                                //       overflow: TextOverflow.ellipsis,
                                //       style: TextStyle(fontSize: 18),
                                //     ),
                                //     onTap: () {
                                //       Navigator.push(
                                //           context,
                                //           MaterialPageRoute(
                                //               builder: (_) => MyApp()));
                                //     },
                                //     trailing: IconButton(
                                //         onPressed: () {},
                                //         icon: Icon(Icons.clear)),
                                //   ),
                                //   Divider(),
                                //   ListTile(
                                //     title: Text(
                                //       "앱 배포까지 함께갈 팀원 구해요.",
                                //       maxLines: 1,
                                //       overflow: TextOverflow.ellipsis,
                                //       style: TextStyle(fontSize: 18),
                                //     ),
                                //     onTap: () {
                                //       Navigator.push(
                                //           context,
                                //           MaterialPageRoute(
                                //               builder: (_) => MyApp()));
                                //     },
                                //     trailing: IconButton(
                                //         onPressed: () {},
                                //         icon: Icon(Icons.clear)),
                                //   ),
                                //   Divider(),

                                //   // Card(
                                //   //   child: GestureDetector(
                                //   //     onTap: () {
                                //   //       Navigator.push(
                                //   //           context,
                                //   //           MaterialPageRoute(
                                //   //               builder: (_) => MyApp()));
                                //   //     },
                                //   //     child: Text(
                                //   //       "간단한 계시판 만들 팀원 구해요.",
                                //   //       maxLines: 1,
                                //   //       overflow: TextOverflow.ellipsis,
                                //   //       style: TextStyle(fontSize: 20),
                                //   //     ),
                                //   //      trailing: IconButton(onPressed: () {}, icon: Icon(Icons.clear)),
                                //   //   ),
                                //   //   color: Color(color_gray),
                                //   //   margin: EdgeInsets.all(2),
                                //   // ),
                                // ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            )),
      );
}
