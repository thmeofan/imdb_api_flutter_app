import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';
import 'package:store_api_flutter_course/consts/global_text_styles.dart';
import 'package:store_api_flutter_course/services/api_handler.dart';

import '../models/movie_part_info_model.dart';
import '../widgets/feeds_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _textEditingController;

  //  List<MoviePartInfoModel> partInfoList = [];
  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  // @override
  // void didChangeDependencies() {
  //   getInfo();
  //   super.didChangeDependencies();
  // }
  //
  // Future<void> getInfo() async {
  //   partInfoList = await APIHandler.getData(request: _textEditingController.text );
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Home', style: AppTextStyles.partInfoTitleStyle),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                 Text("Enter movie name you are looking for", style: AppTextStyles.homeScreenTitleStyle),
                const SizedBox(
                  height: 18,
                ),
                TextField(
                  controller: _textEditingController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Search",
                      filled: true,
                      fillColor: Theme.of(context).cardColor,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          width: 1,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      suffixIcon: Icon(
                        IconlyLight.search,
                        color: lightIconsColor,
                      )),
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
                const SizedBox(
                  height: 18,
                ),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(children: [
                      FutureBuilder<List<MoviePartInfoModel>>(
                          future: APIHandler.getData(
                              request: _textEditingController.text),
                          builder: ((context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasError) {
                              Center(
                                child:
                                    Text("An error occurred ${snapshot.error}"),
                              );
                            } else if (snapshot.data == null) {
                              const Center(
                                child: Text("No movie has been found yet"),
                              );
                             }
                            // else if (snapshot.data == []) {
                            //   const Center(
                            //     child: Text("Enter movie name"),
                            //   );
                            // }
                            else {
                              return FeedsGridWidget(
                                  partInfoList: snapshot.data!);
                            }
                            return Container();
                          }))
                    ]),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
