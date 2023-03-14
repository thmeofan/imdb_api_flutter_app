import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/consts/global_text_styles.dart';

import '../models/movie_part_info_model.dart';
import '../screens/full_movie_info_screen.dart';

class PartInfoWidget extends StatelessWidget {
  const PartInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviePartInfoModelProvider = Provider.of<MoviePartInfoModel>(context);

    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).cardColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: FullMovieInfoScreen(
                  id: moviePartInfoModelProvider.imdbID.toString(),
                ),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FancyShimmerImage(
                    height: size.height * 0.23,
                    width: double.infinity,
                    errorWidget: const Icon(
                      IconlyBold.danger,
                      color: Colors.red,
                      size: 28,
                    ),
                    imageUrl: moviePartInfoModelProvider.poster,
                    boxFit: BoxFit.contain),
              ),
              const SizedBox(height: 5),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        moviePartInfoModelProvider.title.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppTextStyles.partInfoTitleStyle
                      ),
                      Text(
                        moviePartInfoModelProvider.type.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: AppTextStyles.partInfoTextStyle
                        ),
                      Text(
                        moviePartInfoModelProvider.year.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: AppTextStyles.partInfoTextStyle
                        ),
                    ],
                  )),
              SizedBox(
                height: size.height * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
