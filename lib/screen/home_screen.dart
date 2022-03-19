import 'package:flutter/material.dart';
import 'package:spod_app/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("HomeScreen", style: titleTextStyle,),
      ),
    );
  }
}
