import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black38, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(8.0))

  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.pink, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  )
);


