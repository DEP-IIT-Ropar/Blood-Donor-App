import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(

  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.white,width: 2.0)
  ),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.red,width: 2.0)
  ),
);