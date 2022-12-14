import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:mubwara/controller/user_controller.dart';

class Kakaobutton extends ConsumerWidget {
  const Kakaobutton({Key? key}) : super(key: key);

  void _get_user_info() async {
    try {
      User user = await UserApi.instance.me();
      print('사용자 정보 요청 성공'
          '\n회원번호: ${user.id}'
          '\n닉네임: ${user.kakaoAccount?.profile?.nickname}');
    } catch (error) {
      print('사용자 정보 요청 실패 $error');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    KakaoSdk.init(nativeAppKey: 'd86213d1ba0e68d8b7daa5d3180e75dc');
    return Container(
      color: Colors.white,
      child: Center(
        child: TextButton(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child:
                Image.asset("assets/images/util/kakao_login_medium_wide.png"),
          ),
          onPressed: () async {
            if (await isKakaoTalkInstalled()) {
              try {
                await UserApi.instance.loginWithKakaoTalk();
                print('카카오톡으로 로그인 성공');
                _get_user_info();
              } catch (error) {
                print('카카오톡으로 로그인 실패 $error 1');
                // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
                try {
                  await UserApi.instance.loginWithKakaoAccount();
                  print('카카오계정으로 로그인 성공');
                  _get_user_info();
                } catch (error) {
                  print('카카오계정으로 로그인 실패 $error 12');
                }
              }
            } else {
              try {
                OAuthToken token =
                    await UserApi.instance.loginWithKakaoAccount();
                print(token.accessToken);
                print('카카오계정으로 로그인 성공');
                _get_user_info();
                print("아리아");
                ref.read(userController).kakaoLogin(token.accessToken);
              } catch (error) {
                print('카카오계정으로 로그인 실패 $error 123');
              }
            }
          },
        ),
      ),
    );
  }
}
