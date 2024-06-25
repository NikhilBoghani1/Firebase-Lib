import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kind_app/view/auth/auth_view.dart';

class SpleshView extends StatefulWidget {
  const SpleshView({super.key});

  @override
  State<SpleshView> createState() => _SpleshViewState();
}

class _SpleshViewState extends State<SpleshView> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const AuthView(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'K I N D',
          style: TextStyle(
            fontFamily: "PoppinsSB",
            fontSize: 21,
          ),
        ),
      ),
    );
  }
}
