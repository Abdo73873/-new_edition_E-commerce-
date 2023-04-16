// import 'package:flutter/material.dart';
// import 'package:new_edition_shop_app/core/layout/layout.dart';
// import 'package:new_edition_shop_app/core/resources/color_manager.dart';
// import 'package:new_edition_shop_app/core/resources/values_manager.dart';
// import 'package:new_edition_shop_app/core/service/service_locator.dart';
// import 'package:new_edition_shop_app/core/widgets/my_textButton.dart';
// import 'package:new_edition_shop_app/features/on_boarding/model/on_boarding_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//
//
//
// class OnBoarding extends StatefulWidget {
//   const OnBoarding({Key? key}) : super(key: key);
//
//   @override
//   State<OnBoarding> createState() => _OnBoardingState();
// }
//
// var boardController = PageController();
// bool isLast = false;
//
// void submit(context)
// {
//   sl<SharedPreferences>().setBool('onBoarding', true).then((value)
//   {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const LayoutScreen(),
//       ),
//     );
//   });
// }
//
// class _OnBoardingState extends State<OnBoarding> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorManager.sWhite,
//       appBar: AppBar(
//         backgroundColor: ColorManager.sWhite,
//         actions: [
//           MyTextButton(
//             onPressedTextButton: () {
//               submit(context);
//             },
//             text: 'Skip',
//             style: Theme.of(context)
//                 .textTheme
//                 .titleLarge!
//                 .copyWith(color: ColorManager.bTwitter),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(
//           AppPadding.p20,
//         ),
//         child: Column(
//           children: [
//             Expanded(
//               child: PageView.builder(
//                 itemBuilder: (context, index) => buildOnBoarding(
//                   onBoarding[index],
//                   context,
//                 ),
//                 itemCount: onBoarding.length,
//                 controller: boardController,
//                 onPageChanged: (index) {
//                   if (index == onBoarding.length - 1) {
//                     setState(() {
//                       isLast = true;
//                     });
//                   } else {
//                     setState(() {
//                       isLast = false;
//                     });
//                   }
//                 },
//               ),
//             ),
//             const SizedBox(
//               height: AppSize.s30,
//             ),
//             Row(
//               children: [
//                 SmoothPageIndicator(
//                   controller: boardController,
//                   count: onBoarding.length,
//                   axisDirection: Axis.horizontal,
//                   effect: const ExpandingDotsEffect(
//                     expansionFactor: 5.0,
//                     spacing: 8.0,
//                     radius: 4.0,
//                     dotWidth: 15.0,
//                     dotHeight: 12.0,
//                     paintStyle: PaintingStyle.fill,
//                     dotColor: Colors.grey,
//                     activeDotColor: Colors.indigo,
//                   ),
//                 ),
//                 const Spacer(),
//                 FloatingActionButton(
//                   onPressed: () {
//                     if (isLast) {
//                       submit(context);
//                     }
//                     boardController.nextPage(
//                       duration: const Duration(milliseconds: 800),
//                       curve: Curves.fastLinearToSlowEaseIn,
//                     );
//                   },
//                   child: const Icon(
//                     Icons.arrow_forward_ios,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// Widget buildOnBoarding(OnBoardingModel model, context) => Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Expanded(
//           child: Image(
//             image: AssetImage(
//               model.image,
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: AppSize.s30,
//         ),
//         Text(
//           model.body,
//           style: Theme.of(context).textTheme.titleLarge,
//         ),
//         const SizedBox(
//           height: AppSize.s20,
//         ),
//         Text(
//           model.title,
//           style: Theme.of(context).textTheme.titleSmall,
//         ),
//       ],
//     );
