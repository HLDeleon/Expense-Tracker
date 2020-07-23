import 'package:flutter/material.dart';

class TextFormBorder extends InputDecoration {
  String label;

  TextFormBorder({this.label})
      : super(
          labelText: label,
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: new BorderSide(),
          ),
        );
}
