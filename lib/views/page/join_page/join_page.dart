import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/controller/customer/customer_controller.dart';
import 'package:mubwara/views/common/components/toastzip.dart';
import 'package:remedi_kopo/remedi_kopo.dart';

import '../../../dto/request/customer_req_dto.dart';
import '../../layout/default_layout.dart';

class JoinPage extends ConsumerStatefulWidget {
  JoinPage({Key? key}) : super(key: key);

  @override
  ConsumerState<JoinPage> createState() => _joinPage();
}

class _joinPage extends ConsumerState<JoinPage> {
  TextEditingController _AddressController = TextEditingController();
  JoinCustomerReqDto joinCustomerReqDto = JoinCustomerReqDto.origin();
  @override
  Widget build(BuildContext context) {
    final cc = ref.read(customerController);
    return DefaultLayout(
      title: "회원가입",
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            _buildTextFeild(
                feildName: "아이디",
                onChanged: (value) {
                  joinCustomerReqDto.username = value;
                },
                defaultText: "null"),
            Row(
              children: [
                SizedBox(
                  width: 240,
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: Text(
                    '아이디 중복 체크',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            _buildTextFeild(
                feildName: "비밀번호",
                onChanged: (value) {
                  joinCustomerReqDto.password = value;
                },
                defaultText: "null"),
            SizedBox(height: 30),
            _buildTextFeild(
                feildName: "비밀번호 확인",
                onChanged: (value) {},
                defaultText: "null"),
            SizedBox(height: 30),
            _buildTextFeild(
                feildName: "이름",
                onChanged: (value) {
                  joinCustomerReqDto.name = value;
                },
                defaultText: "null"),
            SizedBox(height: 30),
            AddressText(),
            SizedBox(height: 10),
            _buildTextFeild(
                feildName: "전화번호",
                onChanged: (value) {
                  joinCustomerReqDto.phoneNumber = value;
                },
                defaultText: ""
                    "null"),
            SizedBox(height: 30),
            _buildButton(
                buttonName: "회원 가입",
                buttonBackgroundColor: Colors.blue,
                fontColor: Colors.white,
                customerController: cc),
          ],
        ),
      ),
    );
  }

  Widget AddressText() {
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        _addressAPI(); // 카카오 주소 API
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
              width: 330,
              child: TextField(
                decoration: InputDecoration(
                  labelText: '주소',
                  border: OutlineInputBorder(),
                  isDense: false,
                ),
                readOnly: true,
                controller: _AddressController,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 287,
              ),
              TextButton(
                onPressed: () {
                  HapticFeedback.mediumImpact();
                  _addressAPI();
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Text(
                  '주소 검색',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _addressAPI() async {
    KopoModel model = await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => RemediKopo(),
      ),
    );
    _AddressController.text = '${model.address!} ${model.buildingName!}';
  }

  Widget _buildTextFeild(
      {required String feildName,
      required ValueChanged<String>? onChanged,
      required String defaultText}) {
    return Center(
      child: SizedBox(
        width: 330,
        child: TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            labelText: '${feildName}',
            hintText: '${feildName}를 입력하세요',
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
      {required String buttonName,
      required Color buttonBackgroundColor,
      required Color fontColor,
      required CustomerController customerController}) {
    return Container(
      width: 330,
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: buttonBackgroundColor,
        ),
        onPressed: () {
          customerController.joinCustomer(joinCustomerReqDto);
          Navigator.pop(context);
          showJoinFormToast();
        },
        child: Text("${buttonName}",
            style: TextStyle(fontSize: 20, color: fontColor)),
      ),
    );
  }
}
