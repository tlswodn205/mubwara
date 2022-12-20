import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/controller/customer/review_controller.dart';
import 'package:mubwara/domain/review/review.dart';
import 'package:mubwara/views/component/model/review_list_model.dart';
import 'package:mubwara/views/component/review_list_item.dart';
import 'package:mubwara/views/page/shop_page/component/shopReview_list_item.dart';

import '../../../../dto/response/review_resp_dto.dart';

class ShopReviewList extends ConsumerStatefulWidget {
  const ShopReviewList({required this.reviewList, Key? key}) : super(key: key);

  final List<ReviewRespDto> reviewList;
  @override
  ConsumerState<ShopReviewList> createState() => _ReviewListState();
}

class _ReviewListState extends ConsumerState<ShopReviewList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return ShopReviewListItem(
          listIndex: index,
          reviewList: widget.reviewList,
        );
      },
    );
  }
}
