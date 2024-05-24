import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//stateful is mutable we can perform any changes on statefulwidget
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> users=[];
  @override
  //widget is mainly used for building ui
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(

        title: const Text("Abhishek Jha"),),

        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        Padding(
        padding: const EdgeInsets.all(8.0),
      child: Text(
        "All emails are here",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
              Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    final email = user['email'];
                    return ListTile(
                      title: Text(email),
                    );
                  },
                ),
              ),
            ],
        ),
        floatingActionButton: FloatingActionButton(onPressed:  btnpressed),
    );
  }
  void btnpressed() async {

    const url='https://randomuser.me/api/?results=50';

    //A Uniform Resource Identifier
    //(URI) is a string of characters used to identify or name a resource on the internet
    final uri=Uri.parse(url);

    //await:-The async keyword allows the function to use the await keyword inside it.
    // The await keyword is used to pause the execution of an asynchronous function until a particular asynchronous operation is completed. I
  var response=  (await http.get(uri)); //store the response
final body=response.body;//Here wee wil get the response in string format
final json=jsonDecode(body);//Here we convert strring to json
    //
   // The setState() method is used in Flutter to notify
    //the framework that the internal state of a StatefulWidget has changed, and that the UI needs to be rebuilt to reflect those changes.
    setState(() {
      users=json["results"];
    });

  }
}
