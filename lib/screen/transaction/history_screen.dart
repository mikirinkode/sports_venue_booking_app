import 'package:flutter/material.dart';
import 'package:spod_app/theme.dart';
import 'package:spod_app/widget/no_transaction_message.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: NoTranscationMessage(),
      ),
    );
  }
}
