import 'package:dependence_injector/app/core/modules/app_modules.dart';
import 'package:dependence_injector/app/domain/domains/home_domain.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late HomeDomain? homeDomain;
  late Animation<double> animation;
  double opacity = 0;
  AnotherInstance anotherInstance = AnotherInstance();

  @override
  void initState() {
    homeDomain = AppModules.getInstance<HomeDomain>(() => HomeDomain(), true);
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    animation = Tween<double>(begin: 0, end: 360).animate(animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DependenceInjector"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ValueListenableBuilder<bool>(
              valueListenable: homeDomain!.isAnimating,
              builder: (context, isAnimating, widget) {
                if (isAnimating == true) {
                  return const Text(
                    'Animando',
                  );
                } else {
                  return const Text(
                    'Parado',
                  );
                }
              },
            ),
            ValueListenableBuilder<int>(
              valueListenable: homeDomain!.counterValueNotifier,
              builder: (context, counter, widget) {
                return RotationTransition(
                  turns: animation,
                  filterQuality: FilterQuality.low,
                  child: Text(
                    '$counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          homeDomain?.increment();
          homeDomain?.isAnimating.value = true;
          animationController.forward(from: 0).then((value) {
            homeDomain?.isAnimating.value = false;
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AnotherInstance {
  HomeDomain? homeDomain =
      AppModules.getInstance<HomeDomain>(() => HomeDomain(), true);
}
