// // ignore_for_file: file_names
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final firebase = FirebaseFirestore.instance;
//   var currentUser = FirebaseAuth.instance.currentUser;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.of(context)
//               .push(MaterialPageRoute(builder: (context) => const AddMovies()));
//         },
//         child: const Icon(Icons.add),
//         backgroundColor: Theme.of(context).buttonColor,
//       ),
//       backgroundColor: Theme.of(context).canvasColor,
//       body: SafeArea(
//         child: CustomScrollView(
//           slivers: <Widget>[
//             SliverAppBar(
//               actions: [
//                 IconButton(
//                   onPressed: () {
//                     logOut(context);
//                     prefsFalse();
//                     Navigator.of(context).pushReplacement(MaterialPageRoute(
//                         builder: (context) => const LoginScreen()));
//                   },
//                   icon: const Icon(Icons.logout),
//                 ),
//               ],
//               pinned: true,
//               backgroundColor: Theme.of(context).canvasColor,
//               elevation: 0,
//               expandedHeight: 80,
//               flexibleSpace: FlexibleSpaceBar(
//                 titlePadding: EdgeInsets.fromLTRB(0, 0, 30, 0),
//                 title: Text.rich(
//                   TextSpan(
//                     children: [
//                       TextSpan(
//                         text: "   Movie",
//                         style: TextStyle(
//                           color: Theme.of(context).accentColor,
//                           fontWeight: FontWeight.normal,
//                           fontSize: 25,
//                         ),
//                       ),
//                       TextSpan(
//                         text: "List",
//                         style: TextStyle(
//                           color: Theme.of(context).accentColor,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 25,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             StreamBuilder<QuerySnapshot>(
//               stream: firebase.collection("data").doc(currentUser!.uid).collection("data").snapshots(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   return SliverList(
//                     delegate: SliverChildBuilderDelegate(
//                       (BuildContext context, int index) {
//                         QueryDocumentSnapshot x = snapshot.data!.docs[index];
//                         return Column(
//                           children: [
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             GestureDetector(
//                               onTap: () {},
//                               child: Padding(
//                                 padding:
//                                     const EdgeInsets.fromLTRB(16, 0, 16, 0),
//                                 child: Card(
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Container(
//                                           child: ClipRRect(
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                             child: Image.asset(
//                                                 "assets/images/image.jpg",
//                                                 fit: BoxFit.fill),
//                                           ),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Container(
//                                           child: Text(
//                                             x['name'],
//                                             style: TextStyle(
//                                               fontSize: 20,
//                                               fontWeight: FontWeight.bold,
//                                               color:
//                                                   Theme.of(context).accentColor,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Text.rich(
//                                           TextSpan(
//                                             children: [
//                                               TextSpan(
//                                                 text: "Director: ",
//                                                 style: TextStyle(
//                                                   color: Theme.of(context)
//                                                       .accentColor,
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 15,
//                                                 ),
//                                               ),
//                                               TextSpan(
//                                                 text: x['dName'],
//                                                 style: TextStyle(
//                                                   color: Theme.of(context)
//                                                       .accentColor,
//                                                   fontWeight: FontWeight.normal,
//                                                   fontSize: 15,
//                                                 ),
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.end,
//                                         children: [
//                                           ElevatedButton.icon(
//                                             style: ButtonStyle(
//                                                 backgroundColor:
//                                                     MaterialStateProperty.all(
//                                                         Theme.of(context)
//                                                             .buttonColor),
//                                                 shape:
//                                                     MaterialStateProperty.all(
//                                                         RoundedRectangleBorder(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         20)))),
//                                             onPressed: () {},
//                                             icon: Icon(CupertinoIcons.delete),
//                                             label: Text("Delete"),
//                                           ),
//                                           SizedBox(
//                                             width: 10,
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         );
//                       },
//                       childCount: 2,
//                     ),
//                   );
//                 } else {
//                   const CircularProgressIndicator();
//                 }
//                 return const Center();
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
