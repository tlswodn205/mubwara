import 'package:fluttertoast/fluttertoast.dart';
import 'package:mubwara/views/common/const/color.dart';

void showSaveToast() {
  Fluttertoast.showToast(
    msg: "저장완료",
    toastLength: Toast.LENGTH_LONG,
    fontSize: 18.0,
      backgroundColor: PRIMARY_COLOR,
      textColor: Body_TEXT_COLOR1
  );
}
void showShopSaveToast() {
  Fluttertoast.showToast(
      msg: "추가로 메뉴와 테이블 추가를 해주세요",
      toastLength: Toast.LENGTH_LONG,
      fontSize: 18.0,
      backgroundColor: PRIMARY_COLOR,
      textColor: Body_TEXT_COLOR1
  );
}
void showCancleToast() {
  Fluttertoast.showToast(
      msg: "취소",
      toastLength: Toast.LENGTH_LONG,
      fontSize: 18.0,
      backgroundColor: PRIMARY_COLOR,
      textColor: Body_TEXT_COLOR1
  );
}

void showLogoutToast() {
  Fluttertoast.showToast(
      msg: "로그아웃 완료.",
      toastLength: Toast.LENGTH_LONG,
      fontSize: 18.0,
      backgroundColor: PRIMARY_COLOR,
      textColor: Body_TEXT_COLOR1
  );
}

void showLoginToast() {
  Fluttertoast.showToast(
      msg: "로그인 완료.",
      toastLength: Toast.LENGTH_LONG,
      fontSize: 18.0,
      backgroundColor: PRIMARY_COLOR,
      textColor: Body_TEXT_COLOR1
  );
}

void showJoinFormToast() {
  Fluttertoast.showToast(
      msg: "회원가입 완료!",
      toastLength: Toast.LENGTH_LONG,
      fontSize: 18.0,
      backgroundColor: PRIMARY_COLOR,
      textColor: Body_TEXT_COLOR1
  );
}
void showHomeButtonToast() {
  Fluttertoast.showToast(
      msg: "분류 완료",
      toastLength: Toast.LENGTH_LONG,
      fontSize: 18.0,
      backgroundColor: PRIMARY_COLOR,
      textColor: Body_TEXT_COLOR1
  );
}