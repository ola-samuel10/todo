// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:todo/todo_model.dart';
// import 'package:todo/todo_services.dart';
// import 'package:todo/todohomepage.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<String> services = [
//     'School',
//     'Holiday',
//     'Business',
//     'hopping',
//   ];

//   List<String> images = [
//     'asset/img/bag.png',
//     'asset/img/holiday.png',
//     'asset/img/note.png',
//     'asset/img/school.png',
//   ];
//   bool checking = true;
//   @override
//   Widget build(BuildContext context) {
//     //bool isDark = false;
//     return Scaffold(
     
//       appBar: AppBar(
//         foregroundColor: Colors.white,
//         backgroundColor: Colors.pink,
//         centerTitle: true,
//         title: const Text("Todo List"),
//       ),
//       backgroundColor: Colors.white,
//       floatingActionButton: FloatingActionButton(
//           onPressed: () {
//            Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const Homepage(
                
//                 ),
//               ),
//             );
//             createditmovie(context: context, heading: ("Todo Task"));
//           },
//           child: const Icon( Icons.add, color: Colors.pink, size: 40, )
//           ),
//       body: 
//       Column(
//         children: [
//           Consumer<MovieService>(
//             builder: (context, state, _) {
//               if (state.movies.isEmpty) {
//                 return const Center(
//                   child: Text("No Todo found!", style: TextStyle( color: Colors.pink), ),
//                 );
//               }
//               if (state.movies.isNotEmpty) {
//                 return ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: state.movies.length,
//                   itemBuilder: (context, index) {
//                     MovieModel movie = state.movies[index];
//                     return ListTile(
//                       contentPadding: const EdgeInsets.all(10),
//                       leading: Checkbox(
//                           focusColor: Colors.pink,
//                           value: movie.addedToWatchList,
//                           onChanged: (value) {
//                             setState(() {
//                               context.read<MovieService>().updateMovie(
//                                     movie.copyWith(
//                                       addedToWatchList: !movie.addedToWatchList,
//                                     ),
//                                   );
//                             });
//                           }),
//                       title: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(movie.imageUrl, style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w700,
//                                 decoration: movie.addedToWatchList == true
//                                     ? TextDecoration.lineThrough
//                                     : TextDecoration.none,
//                               ) ),
//                           Text(movie.name,
//                               style: TextStyle(
//                                 decoration: movie.addedToWatchList == true
//                                     ? TextDecoration.lineThrough
//                                     : TextDecoration.none,
//                               )),
//                         ],
//                       ),
//                       trailing: Column(
//                         children: [
                         
//                           Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               // IconButton(
//                               //   onPressed: () {
//                               //     context.read<MovieService>().updateMovie(
//                               //           movie.copyWith(
//                               //             addedToWatchList: !movie.addedToWatchList,
//                               //           ),
//                               //         );
//                               //   },
//                               //   icon: Icon(
//                               //     Icons.watch_later,
//                               //     color: movie.addedToWatchList
//                               //         ? Colors.grey
//                               //         : Theme.of(context).primaryColor,
//                               //   ),
//                               // ),
//                               IconButton(
//                                 onPressed: () {
//                                   createditmovie(
//                                     movie: movie,
//                                     context: context,
//                                   );
//                                 },
//                                 icon: const Icon(Icons.edit),
//                               ),
//                               IconButton(
//                                 onPressed: () {
//                                   context.read<MovieService>().deleteMovie(movie);
//                                 },
//                                 icon: const Icon(Icons.delete),
//                               ),
//                               Text(movie.addedToWatchList == true ? 'Task completed' : 'Not Done', style: TextStyle( color: movie.addedToWatchList == true ?Colors.green :Colors.red),)
//                             ],
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               } else {
//                 return const Text('Something went wrong!');
//               }
//             },
//           ),
//         ],
//       ),

//       //  Column(
//       //   children: [
//       //   SearchAnchor(
//       //       builder: (BuildContext context, SearchController controller) {
//       //     return SearchBar(
//       //       controller: controller,
//       //       padding: const MaterialStatePropertyAll<EdgeInsets>(
//       //           EdgeInsets.symmetric(horizontal: 16.0)),
//       //       onTap: () {
//       //         controller.openView();
//       //       },
//       //       onChanged: (_) {
//       //         controller.openView();
//       //       },
//       //       leading: const Icon(Icons.search),
//       //       trailing: <Widget>[
//       //         Tooltip(
//       //           message: 'Change brightness mode',
//       //           child: IconButton(
//       //             isSelected: isDark,
//       //             onPressed: () {
//       //               setState(() {
//       //                 isDark = !isDark;
//       //               });
//       //             },
//       //             icon: const Icon(Icons.wb_sunny_outlined),
//       //             selectedIcon: const Icon(Icons.brightness_2_outlined),
//       //           ),
//       //         )
//       //       ],
//       //     );
//       //   }, suggestionsBuilder:
//       //           (BuildContext context, SearchController controller) {
//       //     return List<ListTile>.generate(5, (int index) {
//       //       final String item = 'item $index';
//       //       return ListTile(
//       //         title: Text(item),
//       //         onTap: () {
//       //           setState(() {
//       //             controller.closeView(item);
//       //           });
//       //         },
//       //       );
//       //     });
//       //   }),
//       //   SizedBox(height: 20),
//       //   Container(
//       //     height: MediaQuery.of(context).size.height * 0.2,
//       //     width: MediaQuery.of(context).size.width * 0.9,
//       //     decoration: BoxDecoration(
//       //         color: Colors.blueAccent.withGreen(50),
//       //         borderRadius: BorderRadius.circular(20)),
//       //     child: Row(
//       //       children: [
//       //         Image.asset("asset/img/package.png"),
//       //         Expanded(
//       //             child: const Text(
//       //           "Organize your time for more Productive",
//       //           softWrap: true,
//       //           textAlign: TextAlign.center,
//       //           style: TextStyle(color: Colors.white),
//       //         ),
//       //         )
//       //       ],
//       //     ),
//       //   ),
//       //   const Row(
//       //     children: [
//       //       Text(
//       //         "Todo Categories",
//       //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
//       //       )
//       //     ],
//       //   ),
//       //   Row(
//       //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       //     children: List.generate(
//       //         services.length,
//       //         (index) => GestureDetector(
//       //               onTap: () {
//       //                 createditmovie(
//       //                     context: context, heading: (services[index]));
//       //               },
//       //               child: Container(
//       //                   height: 100,
//       //                   width: 60,
//       //                   child: Center(
//       //                     child: Column(
//       //                       children: [
//       //                         Image.asset(images[index]),
//       //                         Text(services[index])
//       //                       ],
//       //                     ),
//       //                   )),
//       //             )),
//       //   ),
//       //   Row(
//       //     children: [Text("Todo Task")],
//       //   ),
//       //   Column(
//       //     children: [
//       //        Consumer<MovieService>(
//       //         builder: (context, state, _) {
//       //           if (state.movies.isEmpty) {
//       //             return const
//       //              Center(
//       //               child: Text("No Todo found!"),
//       //             );
//       //           }
//       //             if (state.movies.isNotEmpty) {
//       //             return
//       //             // Center(
//       //             //   child: Text(state.movies.length.toString()),
//       //             // );
//       //             ListView.builder(
//       //               itemCount: state.movies.length,
//       //               itemBuilder: (context, index) {
//       //                 MovieModel movie = state.movies[index];
//       //                 return Text(movie.name);
//       //                 //  ListTile(
//       //                 //   contentPadding: const EdgeInsets.all(10),
//       //                 //   leading: Image.network(
//       //                 //     movie.imageUrl,
//       //                 //     fit: BoxFit.cover,
//       //                 //   ),
//       //                 //   title: Text(movie.name),

//       //                 // );
//       //               },
//       //             );
//       //           }
//       //           else {
//       //             return const Text('Something went wrong!');
//       //           }
//       //         },
//       //       ),
//       //       // Container(
//       //       //   height: 50,
//       //       //   width: MediaQuery.of(context).size.width * 0.9,
//       //       //   decoration: BoxDecoration(
//       //       //       color: Colors.grey, borderRadius: BorderRadius.circular(20)),
//       //       //   child: Row(
//       //       //     children: [

//       //       //       Checkbox(
//       //       //           focusColor: Colors.blue,
//       //       //           value: checking,
//       //       //           onChanged: (value) {
//       //       //             setState(() {
//       //       //               checking = value;
//       //       //             });
//       //       //           }),
//       //       //       Text(
//       //       //         'data',
//       //       //         style: TextStyle(
//       //       //           decoration: checking == true
//       //       //               ? TextDecoration.lineThrough
//       //       //               : TextDecoration.none,
//       //       //         ),
//       //       //       )
//       //       //     ],
//       //       //   ),
//       //       // ),
//       //     ],
//       //   ),

//       // ]),
//     );
//   }

//   void createditmovie({movie, String? heading, required BuildContext context}) {
//     Random random = Random();
//     TextEditingController nameController = TextEditingController();
//     TextEditingController imgUrlController = TextEditingController();

//     if (movie != null) {
//       nameController.text = movie.name;
//       imgUrlController.text = movie.imageUrl;
//     }

//     showModalBottomSheet(
      
//       backgroundColor: Colors.pink,
//       context: context,
//       isDismissible: true,
//       elevation: 5,
//       builder: (_) {
        
//         return Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(movie != null ? 'Edit Task' : '$heading', style: const TextStyle(color: Colors.white),),
//               TextField(
//                 controller: nameController,
//                 keyboardType: TextInputType.name,
//                 decoration: const InputDecoration(labelText: 'Todo title', labelStyle: TextStyle(color: Colors.white) ),
//               ),
//               const SizedBox(height: 6),
//               TextField(
                
//                 controller: imgUrlController,
//                 keyboardType: TextInputType.name,
//                 decoration: const InputDecoration(
                  
//                   labelText: 'Todo text', 
//                    labelStyle: TextStyle(color: Colors.white)),
//               ),
//               const SizedBox(height: 15),
//               //ElevatedButton(onPressed: () {}, child: Text("Submit")),
//               ElevatedButton(
//                 style: const ButtonStyle( ),
//                 onPressed: () {
//                   if (movie != null) {
//                     context.read<MovieService>().updateMovie(
//                           movie.copyWith(
//                             name: nameController.text,
//                             imageUrl: imgUrlController.text,
//                           ),
//                         );
//                   } else if (nameController.text == '' ||
//                       imgUrlController.text == '') {
//                         Navigator.pop(context);
//                           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('data')));
//                                return ;
//                   }
//                    else {
//                     MovieModel movie = MovieModel(
//                       date: DateTime.timestamp().toString(),
//                       id: random.nextInt(10000),
//                       name: nameController.text,
//                       imageUrl: imgUrlController.text,
//                       addedToWatchList: false,
//                     );
//                     context.read<MovieService>().addMovie(movie);
//                   }

//                   Navigator.pop(context);
//                 },
//                 child: Text(movie != null ? 'Edit' : 'Add', style: const TextStyle(color: Colors.pink),),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// // Column(
// //               children: [
// //                 Container(
// //                   height: 60,
// //                   width: 60,
// //                   decoration: BoxDecoration(
// //                     image:  DecorationImage(image: AssetImage("asset/img/bag.png")),
// //                       color: Colors.white,
// //                       boxShadow:const  [
// //                         BoxShadow(
// //                           color: Colors.grey,
// //                           offset: Offset(
// //                             1.0,
// //                             1.0,
// //                           ),
// //                           blurRadius: 2.0,
// //                           spreadRadius: 2.0,
// //                         ), //BoxShadow

// //                       ],
// //                       borderRadius: BorderRadius.circular(5)),
// //                 ),
// //                 Text("Holiday")
// //               ],
// //             )
