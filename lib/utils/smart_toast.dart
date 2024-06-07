import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

void showToast({
  required String msg,
  required bool isError,
  bool isNeutralMessage = false,
}) {

  BotToast.showSimpleNotification(
    title: msg,
    borderRadius: 10.0,
    duration: const Duration(seconds: 3),
    titleStyle: const TextStyle(color: Colors.white),
    align: Alignment.topRight,
    crossPage: false,
    backgroundColor: isNeutralMessage
        ? Colors.grey
        : isError
            ? Colors.red
            : Colors.green,
  );
}
