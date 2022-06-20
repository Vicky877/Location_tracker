// import 'package:flutter/material.dart';

// import 'package:location_picker/screens/locationPage.dart';
// import 'package:location_picker/screens/mapPage.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int pageIndex = 0;

//   final pages = [
//     mapScreen(),
//     locationPage(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pages[pageIndex],
//       bottomNavigationBar: buildMyNavBar(context),
//     );
//   }

//   Container buildMyNavBar(BuildContext context) {
//     return Container(
//       height: 60,
//       decoration: BoxDecoration(
//         color: Colors.green,
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(20),
//           topRight: Radius.circular(20),
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           IconButton(
//             enableFeedback: false,
//             onPressed: () {
//               setState(() {
//                 pageIndex = 0;
//               });
//             },
//             icon: pageIndex == 0
//                 ? const Icon(
//                     Icons.map_rounded,
//                     color: Colors.white,
//                     size: 35,
//                   )
//                 : const Icon(
//                     Icons.map_outlined,
//                     color: Colors.white,
//                     size: 35,
//                   ),
//           ),
//           IconButton(
//             enableFeedback: false,
//             onPressed: () {
//               setState(() {
//                 pageIndex = 1;
//               });
//             },
//             icon: pageIndex == 1
//                 ? const Icon(
//                     Icons.location_history,
//                     color: Colors.white,
//                     size: 35,
//                   )
//                 : const Icon(
//                     Icons.location_history_rounded,
//                     color: Colors.white,
//                     size: 35,
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }
