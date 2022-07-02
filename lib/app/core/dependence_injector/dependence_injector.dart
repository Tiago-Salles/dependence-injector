typedef InstanceCreator<T> = T Function();

class DependenceInjector {
  DependenceInjector._privateConstructor();
  static final _instance = DependenceInjector._privateConstructor();
  factory DependenceInjector.instance() => _instance;

  final _instances = <Type, _InstanceGenerator<Object>>{};

  void registerInstance<T>(
    InstanceCreator instanceType, {
    bool singletonInstance = false,
  }) {
    _instances[T] = _InstanceGenerator(() => instanceType, singletonInstance);
  }

  T? injectDependence<T extends Object>() {
    final instance = _instances[T]?.genereteInstance();
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
  final InstanceCreator<T> _instanceCreator;
  _InstanceGenerator(this._instanceCreator, this._singletonInstance);

  T? genereteInstance() {
    if (_singletonInstance) {
      _instance = _instanceCreator();
    }
    return _instance ?? _instanceCreator();
  }
}
