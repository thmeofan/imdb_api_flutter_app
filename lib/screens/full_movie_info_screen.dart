import 'dart:developer';

import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:store_api_flutter_course/consts/global_text_styles.dart';
import 'package:store_api_flutter_course/models/movie_full_info_model.dart';
import 'package:store_api_flutter_course/services/api_handler.dart';

import '../consts/global_colors.dart';

class FullMovieInfoScreen extends StatefulWidget {
  const FullMovieInfoScreen({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String id;

  @override
  State<FullMovieInfoScreen> createState() => _FullMovieInfoScreenState();
}

class _FullMovieInfoScreenState extends State<FullMovieInfoScreen> {

  MovieFullInfoModel? fullInfoModel;
  bool isError = false;
  String errorStr = "";

  Future<void> getFullMovieInfo() async {
    try {
      fullInfoModel = await APIHandler.getMovieInfoById(id: widget.id);
    } catch (error) {
      isError = true;
      errorStr = error.toString();
      log("error $error");
    }
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    getFullMovieInfo();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: isError
            ? Center(
                child: Text(
                  "An error occured $errorStr",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w500),
                ),
              )
            : fullInfoModel == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 18,
                        ),
                        Row(
                          children:  [
                            const BackButton(),
                            Text(
                              'Movie List',
                              textAlign: TextAlign.justify,
                              style: AppTextStyles.fullInfoTitleStyle,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 3,
                                    child: Text(
                                      fullInfoModel!.title.toString(),
                                      textAlign: TextAlign.start,
                                      style: AppTextStyles.fullInfoTitleStyle,
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: RichText(
                                      text: TextSpan(children: <TextSpan>[
                                        TextSpan(
                                            text: fullInfoModel!.released
                                                .toString(),
                                            style: TextStyle(
                                                color: lightTextColor,
                                                fontWeight: FontWeight.bold)),
                                      ]),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.4,
                          child: Swiper(
                            itemBuilder: (BuildContext context, int index) {
                              return FancyShimmerImage(
                                width: double.infinity,
                                imageUrl: fullInfoModel!.poster!.toString(),
                                boxFit: BoxFit.contain,
                              );
                            },
                            autoplay: true,
                            itemCount: 3,
                            pagination: const SwiperPagination(
                              alignment: Alignment.bottomCenter,
                              builder: DotSwiperPaginationBuilder(
                                color: Colors.white,
                                activeColor: Colors.red,
                              ),
                            ),
                            // control: const SwiperControl(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text('Director:', style: AppTextStyles.fullInfoTitleStyle),
                              Text(
                                fullInfoModel!.director.toString(),
                                textAlign: TextAlign.start,
                                style: AppTextStyles.fullInfoTextStyle,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                               Text('Description:', style: AppTextStyles.fullInfoTitleStyle),
                              Text(
                                fullInfoModel!.plot.toString(),
                                textAlign: TextAlign.start,
                                style: AppTextStyles.fullInfoTextStyle,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text('Ratings:', style: AppTextStyles.fullInfoTitleStyle),
                              Text(
                                fullInfoModel!.ratings.toString(),
                                textAlign: TextAlign.start,
                                style: AppTextStyles.fullInfoTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
