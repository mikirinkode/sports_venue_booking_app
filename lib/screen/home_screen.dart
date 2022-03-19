import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spod_app/screen/detail_screen.dart';
import 'package:spod_app/theme.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
          Text(
            "HomeScreen",
            style: titleTextStyle,
          ),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return DetailScreen();
            }));
          }, child: Text("Detail Screen"))
        ]),
      ),
    );
  }
}
