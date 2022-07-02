typedef InstanceCreator<T> = T Function();

class DependencyInjector {
  DependencyInjector._privateConstructor();
  static final _instance = DependencyInjector._privateConstructor();
  factory DependencyInjector.instance() => _instance;

  final _instances = <Type, _InstanceGenerator<Object>>{};

  void registerInstance<T extends Object>(
      InstanceCreator<T> instanceType, bool singletonInstance) {
    _instances[T] = _InstanceGenerator(instanceType, singletonInstance);
  }

  T? injectDependency<T extends Object>(
    InstanceCreator<T> instanceType, {
    bool singletonInstance = false,
  }) {
    Object? instance;

    if (_instances.containsKey(T)) {
      instance = _instances[T]?.generateInstance();
    } else {
      registerInstance<T>(instanceType, singletonInstance);
      instance = _instances[T]?.generateInstance();
    }

    if (instance != null && instance is T) {
      return instance;
    } else {
      throw Exception("Error: The instance of ${T.toString()} was not found");
    }
  }
}

class _InstanceGenerator<T> {
  T? _instance;
  final bool _singletonInstance;
  bool firstInstance = true;
  final InstanceCreator<T> _instanceCreator;
  _InstanceGenerator(this._instanceCreator, this._singletonInstance);

  T? generateInstance() {
    if (_singletonInstance && firstInstance) {
      _instance = _instanceCreator();
      firstInstance = false;
    }
    return _instance ?? _instanceCreator();
  }
}
