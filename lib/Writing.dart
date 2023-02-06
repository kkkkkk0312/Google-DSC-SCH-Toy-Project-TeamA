import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gdsc_sch_teama_project/mainpage.dart';
import 'package:gdsc_sch_teama_project/view_myparticipation.dart';
import 'package:gdsc_sch_teama_project/view_mywriting.dart';
import 'package:gdsc_sch_teama_project/view_postdetail.dart';
import 'dart:math';
import 'Basefile.dart';
import 'Mypage.dart';
import 'login.dart';
import 'mainpage.dart';
import 'package:dio/dio.dart';

import 'package:get/get.dart';

import 'view_participation.dart';

List<String> lists = [];
String s = '';

class Writing extends StatefulWidget {
  const Writing({Key? key}) : super(key: key);

  @override
  State<Writing> createState() => WritingState();
}

class WritingState extends State<Writing> {
  int count = 0;
  String sav = "not";
  var response = hostURI + 'user/login';

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController maxpeopleController = TextEditingController(text: '0');

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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => participant()));
                },
                child: Text("참여 인원 보기"),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: TextField(
              controller: titleController,
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
            Text('작성자 : ' + my_name), // 작성자 닉네임
            SizedBox(width: 30),

            TextField(
                controller: maxpeopleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '참여 인원 선택',
                )),

            SizedBox(width: 30),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.people),
            ),
            Text('$count/$maxpeopleController'),
          ]),
          Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 5), //상하좌우 여백
            // 내용이 많으면 깨지니까 깨짐 방지
            child: SingleChildScrollView(
              // 11줄 이상 내용이 기재되어도 출력가능
              child: TextFormField(
                maxLines: 10,
                controller: contentController,
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
              onPressed: () async {
                // lists.add('$sav');
                if (await createRequest() == 0) {
                  Navigator.pop(context);
                  Fluttertoast.showToast(
                      msg: "${titleController.text}을(를) 등록했습니다.");
                } else {
                  Fluttertoast.showToast(msg: "등록에 실패했습니다.");
                }

                Get.to(main_page());
              },
              child: Text("등록"),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                if (count == int.parse(maxpeopleController.text)) {
                  Fluttertoast.showToast(msg: "인원이 초과 되어 참여하실 수 없습니다.");
                } else {
                  setState(() {
                    count++;
                  });
                }
                // Get.to(MyHomePage());
              },
              child: Text("참여"),
            ),
            SizedBox(width: 10), //사이 띄우기
            ElevatedButton(
              onPressed: () async {
                if (await editRequest() == 0) {
                  Navigator.pop(context);
                  Fluttertoast.showToast(msg: "해당 항을(를) 수정했습니다.");
                } else {
                  Fluttertoast.showToast(msg: "수정에 실패했습니다.");
                }
                Get.to(main_page());
              },
              child: Text("수정"),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () async {
                if (await deleteRequest() == 0) {
                  Navigator.pop(context);
                  Fluttertoast.showToast(
                      msg: "${titleController.text}을(를) 삭제했습니다.");
                }
                Get.to(main_page());
              },
              child: Text("삭제"),
            ),
          ]),
        ],
      ),
    );
  }

  // 수정
  Future<int> editRequest() async {
    if (titleController.text == "") {
      return -1;
    }
    Dio dio = Dio();
    String createRequestURI = hostURI + 'post/update';
    Map body = {
      'id': postid_num,
      'title': titleController.text.toString(),
      'contents': contentController.text.toString(),
      'recruitmentNum': int.parse(maxpeopleController.text)
    };

    dio.options.headers['jwt-auth-token'] = token;
    dio.options.headers['jwt-auth-refresh-token'] = refreshToken;
    try {
      var response = await dio.put(createRequestURI, data: body);
      print('====================');
      print('sucess recruit');
      return 0;
    } catch (e) {
      print('====================');
      print('create recruit Err');
      return -1;
    }
  }

  //생성
  Future<int> createRequest() async {
    // 제목 입력 안하면
    if (titleController.text == "") {
      return -1;
    }
    String createRequestURI = hostURI + 'post/save';
    Map body = {
      'userid': 1,
      'title': titleController.text.toString(),
      'contents': contentController.text.toString(),
      'recruitmentNum': int.parse(maxpeopleController.text)
    };
    Dio dio = Dio();
    dio.options.headers['jwt-auth-token'] = token;
    dio.options.headers['jwt-auth-refresh-token'] = refreshToken;
    try {
      var response = await dio.post(createRequestURI, data: body);
      print('====================');
      print('sucess createRequest');
      return 0;
    } catch (e) {
      print('====================');
      print('createRequestErr');
      return -1;
    }
  }

  /// 삭제
  Future<int> deleteRequest() async {
    String deleteRequest = hostURI + 'post/{postId}/delete';

    Dio dio = Dio();
    dio.options.headers['jwt-auth-token'] = token;
    dio.options.headers['jwt-auth-refresh-token'] = refreshToken;
    try {
      var res = await dio.delete(deleteRequest);
      print('success deleteRequest');
      return 0;
    } catch (e) {
      print("====================");
      print('deleteRequestErr');
    }
    return -1;
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
                Get.to(main_page());
              },
              child: Text("등록"),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                Get.off(main_page());
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
                Get.off(main_page());
              },
              child: Text("삭제"),
            ),
          ]),
        ],
      ),
    );
  }
}

// class MyyPage extends StatelessWidget {
//   const MyyPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //여러가지를 배치하다.
//       appBar: AppBar(
//           title: Text('MY'),
//           centerTitle: true,
//           backgroundColor: Colors.white24),

//       body: const Center(
//         child: Text('MY Page!'),
//       ),
//     );
//   }
// }
