//code updatedggit
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// void main() {
//   runApp(MyApp());
// }

// class ToDoApp extends StatelessWidget {
//   const ToDoApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ApiPage(),
//     );
//   }
// }



// class ApiPage extends StatefulWidget {
//   const ApiPage({super.key});

//   @override
//   State<ApiPage> createState() => _ApiPageState();
// }

// class _ApiPageState extends State<ApiPage> {
//   var data;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//                 onPressed: () async {
//                   var response = await http.get(
//                       Uri.parse("https://jsonplaceholder.typicode.com/todos"));
//                   print(response.body);
//                   setState(() {
//                     data = jsonDecode(response.body);
//                   });
//                 },
//                 child: Text("Get data")),
//             data == null
//                 ? CircularProgressIndicator()
//                 : Container(
//                     height: 200,
//                     child: ListView.builder(
//                       itemCount: 10,
//                       itemBuilder: (context, index) {
//                         return Text(data[index]['title']);
//                       },
//                     ),
//                   )
//           ],
//         ),
//       ),
//     );
//   }
// }


//  class ApiPage extends StatefulWidget {
//   const ApiPage({super.key});

//   @override
//   State<ApiPage> createState() => _ApiPageState();
// }

// class _ApiPageState extends State<ApiPage> {
//   var data="";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Column(
//               children: [
//                 Image.network(data,height: 200,),
//                 ElevatedButton(onPressed: () async {
//                       var a= await http.get(
//                           Uri.parse("https://random.dog/woof.json"));
//                       var b=jsonDecode(a.body);
//                       print(b["url"]);
//                       setState(() {
//                         data=b["url"];
//                       });
                     
//                     }, child: Text("Get data")),
//               ],
//             ),

//           ],
//         ),
//       ),
//     );
//   }
// }



// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Homepage(),
//       debugShowMaterialGrid: false,
//     );
//   }
// }


// class Homepage extends StatefulWidget {
//   const Homepage({super.key});

//   @override
//   State<Homepage> createState() => _HomePageState();
// }

// class _HomePageState extends State<Homepage> {
//  // var current =[];
//     var data;
//     var res;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//                 ElevatedButton(
//                  onPressed: () async {
//                     var response = await http.get(
//                         Uri.parse("http://api.weatherapi.com/v1/current.json?key=a3486de9e7174ce6b64101351240406 &q=thrissur"));
//                     data= jsonDecode(response.body); 
//                       print(data["current"]["temp_c"]);
//                         setState(() {
//                           res=data["current"]["temp_c"];
//                         });
//                   },
//                   child: Text("Press me"),
//             ),
//             // Text(res["current"]["temp_c"])
//           ],
//         ),
//       ),
//     );
//   }
// }






// class Homepage extends StatefulWidget {
//   const Homepage({super.key});

//   @override
//   State<Homepage> createState() => _HomepageState();
// }

// class _HomepageState extends State<Homepage> {
//   List categories = [];
//   bool isLoading = true;

  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home"),
//         backgroundColor: Colors.amber,
//       ),
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: ()async {
   

//     var fooddata = await http.get(Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php"));
//     var decodedData = jsonDecode(fooddata.body);

//     setState(() {
//       categories = decodedData['categories'];
//       isLoading = false;
//     });
//   },
//               child: Text("Press")
//             ),
//             isLoading?CircularProgressIndicator():
//             Expanded(
//               child:  ListView.builder(
//                     itemCount: categories.length,
//                     itemBuilder: (context, index) {
//                       var category = categories[index];
//                       return Container(
//                         margin: EdgeInsets.all(10),
//                         padding: EdgeInsets.all(10),
//                         color: const Color.fromARGB(255, 236, 168, 193),
//                         child: Row(
//                           children: [
//                             Image.network(
//                               category['categories'],
//                               height: 80,
//                               width: 80,
//                               fit: BoxFit.cover,
//                             ),
//                             SizedBox(width: 10),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   category['strCategory'],
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 SizedBox(height: 5),
//                                 Container(
//                                   width: 600,
//                                   child: Text(
//                                     category['strCategoryDescription'],
//                                     maxLines:4, 
                                    
//                                   ),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

