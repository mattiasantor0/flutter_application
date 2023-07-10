import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_application/common/costants.dart';
import 'package:flutter_application/service/login/loginService.dart';
import 'package:flutter_application/service/picking/pickingService.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_application/mainPage.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'loginResponse.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Widget page;

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final accessToken = prefs.getString('accessToken');

  if (accessToken != null) {
    page = const Main();
  } else {
    page = LoginPage();
  }

  runApp(MyApp(
    page: page,
  ));
}

class MyApp extends StatelessWidget {
  final Widget page;
  const MyApp({Key? key, required this.page}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: App.navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: page,
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final String title = 'Effettua il login!';

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  String username = '';
  String password = '';
  bool validUsername = false;
  bool validPasswd = false;
  LoginService loginService = LoginService();
  

  @override
  void initState() {
    super.initState();
    usernameController.addListener(() {
      setState(() {
        validUsername = usernameController.text.isNotEmpty;
        username = usernameController.text;
      });
    });
    passwordController.addListener(() {
      setState(() {
        validPasswd = passwordController.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Inserisci nome utente',
                    labelText: 'Nome Utente *',
                  ),
                  // onSaved: (String? value) {
                  // },
                  // validator: (String? value) {
                  //   return (value != null)
                  //       ? ''
                  //       : null;
                  // },
                )),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.lock),
                    hintText: 'Inserisci password',
                    labelText: 'Password *',
                  ),
                  // onSaved: (String? value) {
                  // },
                  // validator: (String? value) {
                  //   return (value != null && value.contains('@'))
                  //       ? 'Do not use the @ char.'
                  //       : null;
                  // },
                )),
            TextButton(
              onPressed: () {
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: const Text(
                'Password dimenticata?',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: 40,
              width: 170,
                child: ElevatedButton(
              onPressed: validUsername && validPasswd
                  ? () async {
                      username = usernameController.text;
                      password = passwordController.text;

                      try {
                        final res = await loginService.login(
                            username, password, context);
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.setString('accessToken', res.accessToken);

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const MainPage()));
                      } catch (e, stacktrace) {
                        if (e is DioException) {
                          print("error");
                          print(e.message);
                        }
                        print(e);
                        errorToast();
                        debugPrintStack(stackTrace: stacktrace);
                      }
                    }
                  : null,
              child: Text('Login',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            ))
          ],
        ),
      ),
    );
  }

  void errorToast() {
    MotionToast.error(
            title: const Text("Errore!"),
            description: const Text("Ricontrolla username o password"))
        .show(context);
  }
}
