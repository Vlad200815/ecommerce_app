// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:ecommerce_app/features/login/login.dart';
// import 'package:ecommerce_app/main.dart';
// import 'package:flutter/material.dart';

// class SignInScreen extends StatefulWidget {
//   const SignInScreen({super.key});

//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen> {
//   String checkData = "no data";
//   List<TodoModel> todos = [];

//   Dio dio = Dio(
//     BaseOptions(
//       baseUrl: "https://jsonplaceholder.typicode.com",
//       connectTimeout: const Duration(seconds: 5),
//       sendTimeout: const Duration(seconds: 5),
//       headers: {'Content-Type': 'application/json'},
//     ),
//   );

//   Future<void> getPosts() async {
//     try {
//       final Response response = await dio.get('/posts/1');
//       log("Data: ${response.data}");
//       // log("Extra: ${response.extra}");
//       // log("Headers: ${response.headers}");
//       // log("Status Message: ${response.statusMessage}");
//       // log("Rediret location: ${response.redirects[0].location}");
//     } catch (e) {
//       log(e.toString());
//     }
//   }

//   Future<void> createPost() async {
//     try {
//       final Response response = await dio.post(
//         '/posts', //endpoint <-
//         data: TodoModel(
//           userId: 55,
//           id: 55,
//           title: "Hello",
//           body: "My name is Vlad",
//         ).toJson(),
//       );
//       if (response.statusCode == 201) {
//         print(response.data);
//       }
//     } on DioException catch (e) {
//       if (e.response != null) {
//         log("Error status: ${e.response?.statusCode}");
//         log("Error data: ${e.response?.data}");
//       } else {
//         log("Error sending request: ${e.message}");
//       }
//     }
//   }

//   Future<List<TodoModel>> getAllTodos() async {
//     try {
//       final Response response = await dio.get("/posts");
//       final List<dynamic> data = response.data;

//       final List<TodoModel> todos = data
//           .map((json) => TodoModel.fromJson(json))
//           .toList();
//       print(todos);
//       return todos;
//     } catch (e) {
//       log(e.toString());
//       rethrow;
//     }
//   }

//   @override
//   void didChangeDependencies() async {
//     super.didChangeDependencies();
//     todos = await getAllTodos();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text("Sing in screen"),
//                 LoginButton(onTap: getAllTodos, buttonText: "Sign In"),
//               ],
//             ),
//           ),

//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: theme.colorScheme.primary,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: ListView.builder(
//                   itemCount: todos.length,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       decoration: BoxDecoration(
//                         color: theme.colorScheme.secondary,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(todos[index].title),
//                                   Text(todos[index].id.toString()),
//                                 ],
//                               ),
//                               Expanded(
//                                 child: Text(
//                                   todos[index].body,
//                                   overflow: TextOverflow.ellipsis,
//                                   maxLines: 3,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class TodoModel {
//   final int userId;
//   final int id;
//   final String title;
//   final String body;

//   const TodoModel({
//     required this.userId,
//     required this.id,
//     required this.title,
//     required this.body,
//   });

//   Map<String, dynamic> toJson() => {
//     "userId": userId,
//     "id": id,
//     "title": title,
//     "body": body,
//   };

//   factory TodoModel.fromJson(Map<String, dynamic> json) {
//     return TodoModel(
//       userId: json["userId"],
//       id: json["id"],
//       title: json["title"],
//       body: json["body"],
//     );
//   }
// }

import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
