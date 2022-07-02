import 'dart:developer';

import 'package:flutter/cupertino.dart';

class HomeDomain {
  HomeDomain() {
    log("-----INSTÂNCIA DO OBJETO CRIADA-----");
  }

  ValueNotifier<int> counterValueNotifier = ValueNotifier<int>(0);
  ValueNotifier<bool> isAnimating = ValueNotifier<bool>(false);
  void increment() {
    counterValueNotifier.value++;
  }
}
