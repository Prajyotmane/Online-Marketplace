
import 'package:firebase_core/firebase_core.dart';
import 'package:marketplace/CacheFileManager.dart';
import 'package:marketplace/InstaPostFeed.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/Signup.dart';
import 'package:marketplace/services/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'LoadingScreen.dart';
import 'constants.dart';
import 'LoginPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _firstName = "",
      _lastName = "",
      _email = "",
      _password = "",
      _confirmPassword = "",
      _pendingPostMessage = "Checking for pending posts";
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    CacheFileManager.init();
  }

  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  //Check if user is logged in by checking the sharedpreferences data
  Future<bool> _isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    bool response = prefs.getBool("USER_LOGGED_IN");
    if (response) {
      _email = prefs.getString("EMAIL");
      _password = prefs.getString("PASSWORD");
    }
    print("Response: " + response.toString()); //Debug message
    return response;
  }

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("MarketPlace"),
              backgroundColor: Colors.black,
            ),
            body: FutureBuilder(
                future: _isUserLoggedIn(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.data == true) {
                      return InstaPostFeed();
                    } else {
                      return Signup();
                    }
                  } else {
                    return SimpleDialog(
                        backgroundColor: Colors.black,
                        children: <Widget>[
                          Center(
                            child: Column(children: [
                              CircularProgressIndicator(),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Please wait",
                                style: TextStyle(color: Colors.white),
                              )
                            ]),
                          )
                        ]);
                  }
                })));
  }
}