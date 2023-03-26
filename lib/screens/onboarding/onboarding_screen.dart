import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../components/onboaring_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(42),
            topRight: Radius.circular(42),
          ),
        ),
        builder: (_) =>  const OnboardContent(),
        isDismissible: false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Image.asset(
        "assets/bg.png",
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
