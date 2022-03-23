import 'package:flutter/material.dart';
import 'package:spod_app/theme.dart';
import 'package:spod_app/widget/no_transaction_message.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

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
