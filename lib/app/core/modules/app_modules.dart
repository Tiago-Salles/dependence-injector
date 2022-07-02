import 'package:dependence_injector/app/core/dependence_injector/dependence_injector.dart';
import 'package:dependence_injector/app/domain/domains/home_domain.dart';

class AppModules {
  final _dependenceInjector = DependenceInjector.instance();

  void initializeModules() {
    _dependenceInjector.registerInstance(() => HomeDomain());
  }
}
