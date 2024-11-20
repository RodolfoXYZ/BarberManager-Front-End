import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'LoginPage.dart';

class LoadPage extends StatefulWidget {
  @override
  _LoadPageState createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
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
