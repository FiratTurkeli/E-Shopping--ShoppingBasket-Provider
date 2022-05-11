import 'package:flutter/material.dart';

import '../../constants/color.dart';

BeveledRectangleBorder buildCardShape(){
  return BeveledRectangleBorder(
    side: BorderSide(
        style: BorderStyle.solid,
        color: primary
    ),
    borderRadius: BorderRadius.circular(15.0),
  );
}