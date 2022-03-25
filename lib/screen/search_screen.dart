import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/sport_field.dart';
import '../theme.dart';
import '../utils/dummy_data.dart';
import '../widget/sport_field_list.dart';

class SearchScreen extends StatefulWidget {
  String selectedDropdownItem;
  List<SportField> fieldList = sportFieldList;

  SearchScreen({required this.selectedDropdownItem});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _query = "";
  String _selectedDropdownItem = "All";
  List<SportField> _fieldList = [];
  List<SportField> _selectedList = [];

  @override
  void initState() {
    super.initState();
    this._query = widget.selectedDropdownItem;
    this._fieldList = widget.fieldList;

    if (_query != ""){
      _selectedDropdownItem = widget.selectedDropdownItem;
      for (int i = 0; i < _fieldList.length; i ++){
        if (_selectedDropdownItem == "All"){
          _selectedList = _fieldList;
        } else if (_fieldList[i].category.name == _selectedDropdownItem){
          _selectedList.add(_fieldList[i]);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlue100,
      appBar: AppBar(
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: primaryColor500,
            statusBarIconBrightness: Brightness.light),
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
            color: primaryColor500,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(CupertinoIcons.arrow_left), color: colorWhite,),
                showDropdown()
              ],
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  color: primaryColor500,
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(borderRadiusSize))),
              child: SearchBar()),
          Expanded(
            child: ListView(
              children: [
                SizedBox(height: 16,),
                Column(
                    children: _selectedList
                        .map((fieldEntity) => SportFieldList(
                      field: fieldEntity,
                    ))
                        .toList())
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget noMatchDataView() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Image.asset(
            "assets/images/no_match_data_illustration.png",
            width: 200,
          ),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            "No Match Data.",
            style: titleTextStyle.copyWith(color: darkBlue300),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            "Sorry we couldn't find what you were looking for, \nplease try another keyword.",
            style: descTextStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget showDropdown() {
    return DropdownButton<String>(
        value: _selectedDropdownItem,
        iconEnabledColor: colorWhite,
        iconDisabledColor: darkBlue500,
        dropdownColor: darkBlue500,
        style: normalTextStyle.copyWith(color: colorWhite),
        icon: Icon(Icons.filter_alt),
        isDense: false,
        isExpanded: false,
        underline: SizedBox(),
        alignment: Alignment.centerRight,
        items: <String>["All", "Basketball", "Futsal", "Table Tennis", "Tennis", "Volley"]
            .map<DropdownMenuItem<String>>((value) => DropdownMenuItem(
                  child: Text(value),
                  value: value,
                ))
            .toList(),
        onChanged: (value) {
          _selectedList = [];
          setState(() {
            _selectedDropdownItem = value.toString();
            for (int i = 0; i < _fieldList.length; i ++){
              if (_selectedDropdownItem == "All"){
                _selectedList = _fieldList;
              } else if (_fieldList[i].category.name == _selectedDropdownItem){
                _selectedList.add(_fieldList[i]);
              }
            }
          });
        });
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
      padding: const EdgeInsets.only(
          left: 16.0, right: 16.0, top: 0.0, bottom: 16.0),
      child: Container(
        decoration: BoxDecoration(
            color: lightBlue100,
            borderRadius: BorderRadius.circular(borderRadiusSize)),
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
