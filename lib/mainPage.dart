import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/common/costants.dart';
import 'package:flutter_application/dataProduct.dart';
import 'package:flutter_application/main.dart';
import 'package:flutter_application/service/picking/pickingService.dart';
import 'package:flutter_application/service/scan/scanService.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainState();
}

class _MainState extends State<MainPage> {
  String res = '';
  ScanService scanService = ScanService();
  PickingService pickingService = PickingService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: scanBarCode,
                icon: const Icon(Icons.camera_alt_outlined),
                label: const Text('Apri fotocamera'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                  onPrimary: Colors.black,
                ),
              ),
              // IconButton(
              //   icon: const Icon(
              //     Icons.logout_rounded,
              //   ),
              //   onPressed: () async {
              //     final SharedPreferences prefs =
              //         await SharedPreferences.getInstance();
              //     await prefs.remove('accessToken');
              //     Navigator.of(context).pushReplacement(
              //         MaterialPageRoute(builder: (context) => LoginPage()));
              //   },
              // )
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.logout_rounded,
              ),
              onPressed: () async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                await prefs.remove('accessToken');
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            )
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                Padding(
                  padding: EdgeInsets.only(top:200),
                  child: Card(
                    color: Color.fromARGB(255, 244, 132, 3),
                    child: new InkWell(
                      onTap: () {
                       pickingList();
                      },
                      child: Container(
                        width: 120.0,
                        height: 150.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:EdgeInsets.only(top:200),
                  child: Card(
                    color: Color.fromARGB(255, 244, 132, 3),
                    child: new InkWell(
                      onTap: () {
                        print("tapped");
                      },
                      child: Container(
                        width: 120.0,
                        height: 150.0,
                      ),
                    ),
                  ),
                )
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Padding(
                  padding: EdgeInsets.only(top:10),
                  child: Card(
                    color: Color.fromARGB(255, 244, 132, 3),
                    child: new InkWell(
                      onTap: () {
                        print("tapped");
                      },
                      child: Container(
                        width: 120.0,
                        height: 150.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:EdgeInsets.only(top:10),
                  child: Card(
                    color: Color.fromARGB(255, 244, 132, 3),
                    child: new InkWell(
                      onTap: () {
                        print("tapped");
                      },
                      child: Container(
                        width: 120.0,
                        height: 150.0,
                      ),
                    ),
                  ),
                ),
               
              ],)
            ],
          ),
        ));
  }

  Future scanBarCode() async {
    String res;

    try {
      res = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Annulla", true, ScanMode.BARCODE);
    } on PlatformException {
      res = '';
    }

    setState(() {
      this.res = res;
    });

    try {
      final product = await scanService.scanCode(res, context);
      print(product.toJson());

      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DataProductPage(product: product)));
    } catch (e, stacktrace) {
      if (e is DioException) {
        print(e.message);
      }

      print(e);
      errorToast();
      debugPrintStack(stackTrace: stacktrace);
    }
  }

  void errorToast() {
    MotionToast.error(
            title: Text("Errore"), description: Text("Codice non trovato!"))
        .show(context);
  }



  Future pickingList() async{
    try {
      final list = await pickingService.getPickingList();
      print(list.toJson());

      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MainPage()));
    } catch (e, stacktrace) {
      if (e is DioException) {
        print(e.message);
      }

      print(e);
      errorToast();
      debugPrintStack(stackTrace: stacktrace);
    }
  }
}
