import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWidgets {
  Widget textFormField(
      {String labelText, String Function() errorText, onChanged}) {
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        errorText: errorText == null ? null : errorText(),
      ),
    );
  }
}
