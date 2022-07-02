import 'dart:developer';
import 'package:flutter/cupertino.dart';

abstract class IDomain {
  ValueNotifier<int>? counterValueNotifier;
  ValueNotifier<bool>? isAnimating;
  void increment();
}

class HomeDomain implements IDomain {
  HomeDomain() {
    log("-----INSTÂNCIA DO OBJETO CRIADA-----");
  }

  @override
  ValueNotifier<int>? counterValueNotifier = ValueNotifier<int>(0);

  @override
  ValueNotifier<bool>? isAnimating = ValueNotifier<bool>(false);

  @override
  void increment() {
    counterValueNotifier?.value++;
  }
}
