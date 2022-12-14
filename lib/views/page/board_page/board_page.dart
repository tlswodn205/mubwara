import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/controller/review_controller.dart';
import 'package:mubwara/dto/response/review_resp_dto.dart';
import 'package:mubwara/views/page/board_page/board_page_model.dart';
import '../../../domain/review/review.dart';

import '../search_page/component/restaurant_card.dart';
import 'component/review_item.dart';

class BoardPage extends ConsumerWidget {
  const BoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bpm = ref.watch(boardPageModel);
    final rc = ref.read(reviewController);
    return RefreshIndicator(
      onRefresh: () => rc.boardRefresh(),
      child: ListView.builder(
        itemCount: bpm.length,
        itemBuilder: (context, index) {
          return ReviewItem(
            listIndex: index,
            bpm: bpm,
          );
        },
      ),
    );
  }
}
