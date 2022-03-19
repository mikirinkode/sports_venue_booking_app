import 'package:flutter/material.dart';

import '../theme.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("HistoryScreen", style: titleTextStyle,),
      ),
    );
  }
}
