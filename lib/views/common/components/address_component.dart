import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remedi_kopo/remedi_kopo.dart';

//remedi_kopo: ^0.0.1 << yaml에 넣기

class AddressComponent extends StatefulWidget {
  const AddressComponent({Key? key}) : super(key: key);

  @override
  State<AddressComponent> createState() => _AddressComponentState();
}

class _AddressComponentState extends State<AddressComponent> {
  TextEditingController _AddressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AddressText(),
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
}
