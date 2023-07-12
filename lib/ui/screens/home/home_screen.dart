import 'package:flutter/material.dart';
import 'package:flutter_planets_ui/data/memory/in_memory_planets.dart';
import 'package:flutter_svg/flutter_svg.dart';

const _duration = Duration(milliseconds: 300);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //double _valueSwitch = 0.0;
  int _valuePage = 0;
  final _pageController = PageController(viewportFraction: 0.35);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Radial Top Blue
          Positioned(
            top: 0,
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
            bottom: 0,
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
          // Image background
          Positioned(
            left: -200,
            right: -200,
            top: -220,
            bottom: -200,
            child: TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 1000),
              //curve: Curves.easeInOutBack,
              tween: Tween(begin: 0.0, end: _valuePage.toDouble()),
              builder: (context, turn, child) {
                return Transform.rotate(
                  alignment: Alignment.center,
                  angle: turn * 0.1,
                  child: const Image(
                    image: AssetImage('assets/images/space.png'),
                  ),
                );
              },
            ),
          ),
          //Title and logo
          Positioned(
            top: size.height * 0.05,
            left: 0,
            right: 0,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'SPACE',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Hero(
                    tag: 'logo',
                    child: Image(
                      color: Colors.white,
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                ),
                Text(
                  'TOUR',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          //Image of planets
          Positioned(
            top: size.height * 0.15,
            left: 0,
            right: 0,
            child: Container(
              height: 300,
              padding: const EdgeInsets.all(8.0),
              child: TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 1000),
                tween: Tween(begin: 0.0, end: _valuePage.toDouble()),
                builder: (context, turn, child) {
                  return Transform.rotate(
                    alignment: Alignment.center,
                    angle: turn * 1.5,
                    child: AnimatedSwitcher(
                      duration: _duration,
                      child: Image(
                        key: Key(planets[_valuePage].name),
                        width: 300,
                        image: AssetImage(planets[_valuePage].image),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              width: size.width,
              height: size.height * 0.45,
              child: Stack(
                children: [
                  // const GlassBox(
                  //   width: double.infinity,
                  //   height: double.infinity,
                  //   borderRadius: BorderRadius.only(
                  //       topLeft: Radius.circular(36),
                  //       topRight: Radius.circular(36)),
                  //   sigma: 2.0,
                  // ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: AnimatedSwitcher(
                          duration: _duration,
                          child: Text(
                            key: Key(planets[_valuePage].name),
                            planets[_valuePage].name,
                            style: const TextStyle(
                                fontSize: 60, color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: AnimatedSwitcher(
                          duration: _duration,
                          child: Text(
                            key: Key(planets[_valuePage].name),
                            planets[_valuePage].description,
                            textAlign: TextAlign.justify,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              const Text(
                                'RADIUS',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              AnimatedSwitcher(
                                duration: _duration,
                                child: Text(
                                  key: Key(planets[_valuePage].name),
                                  planets[_valuePage].radius,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text(
                                'GRAVITY',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              AnimatedSwitcher(
                                duration: _duration,
                                child: Text(
                                  key: Key(planets[_valuePage].name),
                                  planets[_valuePage].gravity,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Expanded(
                        child: PageView.builder(
                          controller: _pageController,
                          onPageChanged: (value) {
                            setState(() {
                              _valuePage = value;
                            });
                          },
                          itemCount: planets.length,
                          physics: const BouncingScrollPhysics(
                              parent: ClampingScrollPhysics()),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              margin: EdgeInsets.only(
                                top: index == _valuePage ? 40 : 60,
                                bottom: index == _valuePage ? 40 : 60,
                              ),
                              child: SvgPicture.asset(planets[index].picture),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
