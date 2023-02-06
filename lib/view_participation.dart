import 'package:flutter/material.dart';
import 'package:gdsc_sch_teama_project/view_postdetail.dart';

class participant extends StatefulWidget {
  const participant({Key? key}) : super(key: key);

  @override
  State<participant> createState() => view_participant();
}

class view_participant extends State<participant> {
  List<String> strList = [
    "박가은 - 프론트엔드",
    "강재영 - 백엔드",
    "이하늘 - 머신러닝",
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text("참여 인원 보기")),
      body: Center(
          child: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: strList.length,
        itemBuilder: (BuildContext context, int index) => Card(
          child: Text(
            strList[index],
            style: TextStyle(fontSize: 35),
          ),
          color: Colors.white70,
          margin: EdgeInsets.all(20),
        ),
      )));
}
