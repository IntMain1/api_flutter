import '../constants/constants.dart';
import '../screens/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const Home(),
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 180,
              ),
              Container(
                height: 235,
                width: 303,
                child: Image.asset("lib/assets/images/logo.png"),
              ),
              Container(
                child: Text(
                  "Insight News",
                  style: TextStyle(
                    fontSize: 25,
                    color: AppStyle.white_t,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  "Stay Informed, Anytime, Anywhere.",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppStyle.grey_t,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
