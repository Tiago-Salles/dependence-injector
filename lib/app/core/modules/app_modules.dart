import 'package:dependence_injector/app/core/dependency_injector/dependency_injector.dart';

class AppModules {
  static T? getInstance<T extends Object>(
    InstanceCreator<T> instanceType,
    bool singletonInstance,
  ) {
    final dependencyInjector = DependencyInjector.instance();
    return dependencyInjector.injectDependency<T>(instanceType,
        singletonInstance: singletonInstance);
  }
}
