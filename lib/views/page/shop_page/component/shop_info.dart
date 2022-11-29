import 'package:flutter/material.dart';

class ShopInfo extends StatelessWidget {
  const ShopInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Row(
            children: [
              Container(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '주차장 완비, 단체석(20석)',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }

  // Widget changeText(){
  //   if(){
  //     return Image.asset(name)
  //   }else{
  //     return Text();
  //   }
  // }
}