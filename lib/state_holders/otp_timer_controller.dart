import 'dart:async';

import 'package:get/get.dart';

class OTPTimerController extends GetxController {
  late int _remainingSeconds;

  int get remainingSeconds => _remainingSeconds;

  Future<void> startTimer() async {
    for (_remainingSeconds = 120; _remainingSeconds > 0; _remainingSeconds--) {
      await Future.delayed(Duration(seconds: 1));
      update();
    }
  }
}
