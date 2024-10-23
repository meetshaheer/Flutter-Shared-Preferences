import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SharedPrefences(),
    );
  }
}

class SharedPrefences extends StatefulWidget {
  const SharedPrefences({super.key});

  @override
  State<SharedPrefences> createState() => _SharedPrefencesState();
}

class _SharedPrefencesState extends State<SharedPrefences> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  var nameValue = "";
  login(email, pass) {
    if (email == "Shaheer" && pass == "12345") {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeView()));
    }
  }

  void getValue() async {
    var prefs = await SharedPreferences.getInstance();
    var getname = prefs.getString("name");
    setState(() {
      nameValue = getname != null ? getname : "No Value Saved";
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 183, 207),
        title: const Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: email,
                decoration: const InputDecoration(
                  label: Text("Email ID"),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // TextFormField(
              //   controller: pass,
              //   decoration: const InputDecoration(
              //     label: Text("Password"),
              //     border: OutlineInputBorder(
              //       borderSide: BorderSide(
              //         color: Colors.black,
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 42,
              ),
              ElevatedButton(
                onPressed: () async {
                  // login(email.text, pass.text);
                  var name = email.text.toString();
                  var prefs = await SharedPreferences.getInstance();
                  setState(() {
                    getValue();
                  });
                },
                child: const Text("Save Now"),
              ),
              Text(nameValue)
            ],
          ),
        ),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared Preference"),
      ),
      body: const Center(
        child: Text("Login Details Same"),
      ),
    );
  }
}
