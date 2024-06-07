import 'package:flutter/material.dart';
import 'package:enuaniculturalforummobile/src/config.dart';

InputDecoration customInputDecoration = InputDecoration(
    prefixStyle: const TextStyle(color: Colors.blueGrey),
    focusColor: AppColors.kPrimary2,
    iconColor: Colors.blueGrey,
    prefixIconColor: Colors.blueGrey,
    suffixIconColor: Colors.blueGrey,
    suffixStyle: const TextStyle(color: Colors.blueGrey),
    errorStyle: const TextStyle(color: Colors.redAccent),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.redAccent, width: 0.8),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.redAccent, width: 1.5),
    ),
    filled: false,
    contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
    //fillColor: Colors.grey.shade200,
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color:  AppColors.kDisabledButton, width: 1.0),
    ),
    // focusedBorder: OutlineInputBorder(
    //   borderSide: BorderSide(color:  AppColors.kPrimary2, width: 1.0),
    // ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
    borderSide:
    BorderSide(color: const Color(0xff3565A1), width: 2.sp),
  ),
    border: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.redAccent, width: 1.5),
    ),
   );