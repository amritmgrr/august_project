import 'package:august/src/view/screens/Login.dart';
import 'package:august/src/view/utilis/media.dart';
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
    navigate();
  }

   navigate(){
    Future.delayed(Duration(seconds:2),(){
      Navigator.of(context)
       .pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(appLogo),
            // Image.network(
            //   "https://upload.wikimedia.org/wikipedia/commons/e/e8/Tesla_logo.png"),
            CircularProgressIndicator.adaptive(
              backgroundColor: Colors.green,

            )
          ],
        ),
      ),
    );
  } 
}