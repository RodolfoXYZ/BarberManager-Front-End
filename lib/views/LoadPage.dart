import 'package:barbershop_app/services/localstorage-service.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadPage extends StatefulWidget {
  @override
  _LoadPageState createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  var storage = LocalStorageService();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
    final token = await storage.getItem("access_token");
    Future.delayed(Duration(seconds: 5), () {
      if (token == null) {
        Navigator.pushReplacementNamed(context, 'login');
      } else {
        Navigator.pushReplacementNamed(context, 'home');
      }
    });
  });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png'),
            SizedBox(height: 50),
            Shimmer.fromColors(
              baseColor: Color.fromARGB(255, 247, 235, 235),
              highlightColor: Color.fromARGB(255, 255, 255, 255),
              child: Container(
                width: 150,
                height: 10,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
