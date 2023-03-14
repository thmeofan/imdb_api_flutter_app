// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../models/movie_full_info_model.dart';
// import '../models/movie_part_info_model.dart';
// import '../services/api_handler.dart';
// import '../widgets/part_info_widget.dart';
//
// class PartMovieInfoScreen extends StatefulWidget {
//   const PartMovieInfoScreen({Key? key}) : super(key: key);
//
//   @override
//   State<PartMovieInfoScreen> createState() => _PartMovieInfoScreenState();
// }
//
// class _PartMovieInfoScreenState extends State<PartMovieInfoScreen> {
//   final ScrollController _scrollController = ScrollController();
//   List<MoviePartInfoModel> partInfoList = [];
//
//   bool _isLoading = false;
//
//   @override
//   void initState() {
//     getMoviePartInfo();
//     super.initState();
//   }
//
//   @override
//   void didChangeDependencies() {
//
//     _scrollController.addListener(() async {
//       if (_scrollController.position.pixels ==
//           _scrollController.position.maxScrollExtent) {
//         _isLoading = true;
//         print("_isLoading $_isLoading");
//
//         await getMoviePartInfo();
//         _isLoading = false;
//
//       }
//     });
//     super.didChangeDependencies();
//   }
//
//   // Future<void> getMoviePartInfo() async {
//   //   //partInfoList = (await APIHandler.getData(
//   //    // request: _textEditingController.text,
//   //
//   //   )).cast<MoviePartInfoModel>();
//   //   setState(() {});
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//          elevation: 4,
//         title: const Text(''),
//       ),
//       body: partInfoList.isEmpty
//           ? const Center(
//               child: CircularProgressIndicator(),
//             )
//           : SingleChildScrollView(
//               controller: _scrollController,
//               child: Column(
//                 children: [
//                   GridView.builder(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemCount: partInfoList.length,
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 2,
//                               crossAxisSpacing: 0.0,
//                               mainAxisSpacing: 0.0,
//                               childAspectRatio: 0.7),
//                       itemBuilder: (ctx, index) {
//                         return ChangeNotifierProvider.value(
//                             value: partInfoList[index],
//                             child: const FeedsWidget());
//                       }),
//                   if (_isLoading)
//                     const Center(child: CircularProgressIndicator()),
//                 ],
//               ),
//             ),
//     );
//   }
// }
