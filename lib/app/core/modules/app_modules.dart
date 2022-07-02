import 'package:dependence_injector/app/core/dependence_injector/dependence_injector.dart';

class AppModules {
  static T? getInstance<T extends Object>(
    InstanceCreator<T> instanceType,
    bool singletonInstance,
  ) {
    final dependenceInjector = DependenceInjector.instance();
    return dependenceInjector.injectDependence<T>(instanceType,
        singletonInstance: singletonInstance);
  }
}
