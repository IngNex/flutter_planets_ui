import 'package:flutter/material.dart';
import 'package:flutter_planets_ui/ui/screens/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(seconds: 1),
          pageBuilder: (context, animation, _) {
            return FadeTransition(
              opacity: animation,
              child: const HomeScreen(),
            );
          },
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: -50,
            left: 0,
            right: 0,
            child: Container(
              height: size.width,
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.topCenter,
                  radius: 0.8,
                  colors: [Color.fromARGB(255, 0, 81, 255), Colors.black],
                ),
              ),
            ),
          ),
          // Radial Bottom Blue
          Positioned(
            bottom: -50,
            left: 0,
            right: 0,
            child: Container(
              height: size.width,
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                    center: Alignment.bottomCenter,
                    radius: 0.8,
                    colors: [Color.fromARGB(255, 0, 81, 255), Colors.black]),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.35,
            left: 0,
            right: 0,
            child: Column(
              children: [
                TweenAnimationBuilder(
                  duration: const Duration(milliseconds: 1500),
                  curve: Curves.easeOutBack,
                  tween: Tween(begin: 1.0, end: 0.0),
                  builder: (context, value, child) {
                    return Transform.translate(
                      offset: Offset(0, -200 * value),
                      child: Transform.rotate(
                        angle: -value * 4,
                        alignment: Alignment.center,
                        child: Container(
                          width: 200,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/star.png'),
                            ),
                          ),
                          child: const Hero(
                            tag: 'logo',
                            child: Image(
                              color: Colors.white,
                              image: AssetImage('assets/images/logo.png'),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                TweenAnimationBuilder(
                  duration: const Duration(milliseconds: 1700),
                  curve: Curves.easeOutBack,
                  tween: Tween(begin: 1.0, end: 0.0),
                  builder: (context, value, child) {
                    return Transform.translate(
                      offset: Offset(0, -150 * value),
                      child: const Text(
                        'SPACE TOUR',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Text(
              '© MaicolDev',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
