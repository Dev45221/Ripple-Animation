import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  late Animation rippleAnimation;
  late AnimationController animationController;

  var arrRadius = [100.0, 150.0, 200.0, 250.0, 300.0];

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 5), lowerBound: 0.1);
    // rippleAnimation = Tween(begin: 0.0, end: 1.0).animate(animationController);

    animationController.addListener(() {
      setState(() {
      });
    });
    animationController.forward();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Ripple Animation"),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            buildContainer(arrRadius[0]),
            buildContainer(arrRadius[1]),
            buildContainer(arrRadius[2]),
            buildContainer(arrRadius[3]),
            buildContainer(arrRadius[4]),

            const Icon(Icons.access_alarm, size: 40,),
          ]
        ),
      )
    );
  }

  Widget buildContainer(radius) {
    return Container(
      width: radius*animationController.value,
      height: radius*animationController.value,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.deepPurple.shade200.withOpacity(1.0 - animationController.value),
      ),
    );
  }

}