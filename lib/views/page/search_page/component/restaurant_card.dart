import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mubwara/views/common/const/color.dart';

class RestaurantCard extends StatelessWidget {
  // 이미지
  final Image image;

  // 레스토랑 이름
  final String shop_name;

  // 레스토랑 태그
  final List<String> tags;

  // 주소
  final String address;

  // 가게 소개
  final String information;

  // 전화번호
  final String telephone;

  // 여는 시간
  final String open_time;

  // 닫는 시간
  final String close_time;

  // 상세 내용
  final String? detail;

  final double scoreAvg;

  final int review_count;

  const RestaurantCard({
    required this.image,
    required this.shop_name,
    required this.tags,
    required this.address,
    required this.telephone,
    required this.open_time,
    required this.close_time,
    required this.information,
    required this.scoreAvg,
    required this.review_count,
    this.detail,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: image,
        ),
        const SizedBox(height: 16.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text(
                    shop_name,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    CupertinoIcons.star_fill,
                    size: 16,
                    color: Colors.yellow,
                  ),
                  Text(
                    '${scoreAvg}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    tags.join(' · '),
                    style: TextStyle(
                      color: Body_TEXT_COLOR,
                      fontSize: 14.0,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8.0),
              Text(
                information,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              _IconText(
                icon: Icons.home,
                label: address.toString(),
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  _IconText(
                    icon: Icons.phone,
                    label: telephone.toString(),
                  ),
                  renderDot(),
                  _IconText(
                    icon: Icons.timelapse_outlined,
                    label: '$open_time ',
                  ),
                  renderDot(),
                  _IconText(
                    icon: Icons.monetization_on,
                    label: '$close_time ',
                  ),
                ],
              ),
              if (detail != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(detail!),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget renderDot() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Text(
        '·',
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _IconText extends StatelessWidget {
  final IconData icon;
  final String label;

  const _IconText({required this.icon, required this.label, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: PRIMARY_COLOR,
          size: 14.0,
        ),
        const SizedBox(width: 8.0),
        Text(
          label,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
