import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Rest api call',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: users.length == 0
          ? MyCircularProgressIndicator()
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                final email = user['email'];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.black, // Set your desired background color here
                    child: Text('${index + 1}'),
                  ),
                  title: Text(email),
                );
              }),
      floatingActionButton: FloatingActionButton(onPressed: fetchUsers),
    );
  }

  void fetchUsers() async {
    print("onclick");
    const url = 'https://randomuser.me/api/?results=20';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['results'];
    });
    print(json);
  }
}

class MyCircularProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
