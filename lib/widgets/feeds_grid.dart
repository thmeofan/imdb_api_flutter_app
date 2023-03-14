import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/movie_part_info_model.dart';
import 'part_info_widget.dart';

class FeedsGridWidget extends StatelessWidget {
  const FeedsGridWidget({Key? key, required this.partInfoList})
      : super(key: key);
  final List<MoviePartInfoModel> partInfoList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: partInfoList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 0.0,
            childAspectRatio: 0.6),
        itemBuilder: (ctx, index) {
          return ChangeNotifierProvider.value(
            value: partInfoList[index],
            child: const PartInfoWidget(),
          );
        });
  }
}
