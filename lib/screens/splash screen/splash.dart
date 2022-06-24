// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../mainWrapper/mainWrapper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool change = true;
  @override
  void initState() {
    loading();
    super.initState();
  }

  loading() async {
    await Future.delayed(const Duration(milliseconds: 600));
    setState(() {
      change = false;
    });
    await Future.delayed(const Duration(milliseconds: 1000));
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const MainWrapper(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: (change)
                    ? const Text(
                        "TODO APP",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    : const CupertinoActivityIndicator(
                        animating: true,
                        color: Colors.white,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
