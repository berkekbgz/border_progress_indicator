import 'package:flutter/material.dart';
import 'package:border_progress_indicator/border_progress_indicator.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    double value = .6;

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Normal Version
              BorderProgressIndicator(
                borderRadius: 10,
                value: value,
                color: Colors.red,
                strokeWidth: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 200,
                  height: 50,
                  child: const Center(child: Text('Normal Version')),
                ),
              ),
              const SizedBox(height: 24),
              // Self Animated Version
              AnimatedBorderProgressIndicator(
                borderRadius: 10,
                value: value,
                color: Colors.red,
                curve: Curves.easeInCubic,
                strokeWidth: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 200,
                  height: 50,
                  child: const Center(child: Text('Animated Version')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
