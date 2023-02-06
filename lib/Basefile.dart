import 'package:flutter/cupertino.dart';

/// API
String hostURI = 'http://15.165.105.176:8080/';
String token = '';
String refreshToken = '';
String my_email = 'hong123@gmail.';
String my_name = '홍길동';
int postid_num = 1;

/// 모바일 화면 구하는 함수(context, 변환하고자 하는 퍼센테이지, 가로,세로 여부/가로 true, 세로: false)
double getMobileSizeFromPercent(
    BuildContext context, int percent, bool isWidth) {
  if (isWidth) {
    return MediaQuery.of(context).size.width * percent / 100;
  } else {
    return MediaQuery.of(context).size.height * percent / 100;
  }
}

/// 오늘 날짜 반환
String getToday() {
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  int day = DateTime.now().day;
  return year.toString() +
      (month < 10 ? "0" + month.toString() : month.toString()) +
      (day < 10 ? "0" + day.toString() : day.toString());
}
