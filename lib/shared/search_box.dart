import 'package:flutter/material.dart';

import '../constants/colors.dart';

class SearchBox extends StatelessWidget {
  final Function(String) onchange;
  const SearchBox({super.key, required this.onchange});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        onChanged: onchange,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(10),
          prefixIcon: Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.search,
              color: tdBlackColor,
              size: 20,
            ),
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            maxWidth: 24,
          ),
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: TextStyle(color: tdGreyColor),
        ),
      ),
    );
  }
}
