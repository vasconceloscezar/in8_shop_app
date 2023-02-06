import 'package:e_commerce_app/helper/debouncer.dart';
import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';

class TextFieldDebouced extends StatefulWidget {
  String hintText;
  void Function(String value) debouncedCallback;

  TextFieldDebouced(
      {Key? key, required this.hintText, required this.debouncedCallback})
      : super(key: key);

  @override
  State<TextFieldDebouced> createState() => _TextFieldDeboucedState();
}

class _TextFieldDeboucedState extends State<TextFieldDebouced> {
  final _debouncer = Debouncer(milliseconds: 500);
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: (value) {
        _debouncer.call(() {
          widget.debouncedCallback(value);
          // Perform the actual search request here
        });
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenWidth(9)),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: widget.hintText,
          prefixIcon: const Icon(Icons.search)),
    );
  }
}
