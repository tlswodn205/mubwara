import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/controller/customer/review_controller.dart';
import 'package:mubwara/domain/review/review.dart';
import 'package:mubwara/views/component/model/review_list_model.dart';
import 'package:mubwara/views/component/review_list_item.dart';

class ReviewList extends ConsumerStatefulWidget {
  const ReviewList({Key? key}) : super(key: key);

  @override
  ConsumerState<ReviewList> createState() => _ReviewListState();
}

class _ReviewListState extends ConsumerState<ReviewList> {
  @override
  Widget build(BuildContext context) {
    final sm = ref.watch(reviewListModel);
    final sc = ref.read(reviewController);
    if (sm.length == 0) {
      return Center(
        child: Text("작성한 리뷰가 없습니다."),
      );
    }
    return RefreshIndicator(
      onRefresh: () => sc.refresh(),
      child: ListView.builder(
        itemCount: sm.length,
        itemBuilder: (context, index) {
          return ReviewListItem(
            listIndex: index,
            sm: sm,
          );
        },
      ),
    );
  }
}
