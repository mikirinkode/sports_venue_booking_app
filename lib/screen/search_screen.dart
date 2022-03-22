import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: primaryColor500,
            statusBarIconBrightness: Brightness.light
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.filter_alt_outlined))
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: primaryColor500,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(borderRadiusSize))
            ),
              child: SearchBar()),
          SizedBox(height: 24,),
          Center(child: noMatchDataView())
        ],
      ),
    );
  }

  Widget noMatchDataView() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Image.asset("assets/images/no_match_data_illustration.png", width: 200,),
          const SizedBox(height: 16.0,),
          Text(
            "No Match Data.",
            style: titleTextStyle.copyWith(color: darkBlue300),
          ),
          const SizedBox(height: 8.0,),
          Text(
            "Sorry we couldn't find what you were looking for, \nplease try another keyword.",
            style: descTextStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = TextEditingController();
  String _userInput = "";

  final FocusNode node = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 0.0, bottom: 16.0),
      child: Container(
        decoration: BoxDecoration(
            color: lightBlue100,
            borderRadius: BorderRadius.circular(borderRadiusSize)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
          child: TextField(
            focusNode: node,
            onChanged: (String value) {
              setState(() {
                _userInput = value;
              });
            },
            controller: _controller,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search...",
                suffixIcon: _controller.text.isEmpty
                    ? Container(
                  width: 0,
                )
                    : IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => _controller.clear(),
                )),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
