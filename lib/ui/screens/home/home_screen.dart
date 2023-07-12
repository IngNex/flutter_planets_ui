import 'package:flutter/material.dart';
import 'package:flutter_planets_ui/data/memory/in_memory_planets.dart';
import 'package:flutter_planets_ui/ui/widgets/GlassBox.dart';
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
          Positioned(
            left: -200,
            right: -200,
            top: -250,
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
                    ));
              },
            ),
          ),
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
          Positioned(
            top: size.height * 0.12,
            left: 0,
            right: 0,
            child: Container(
              height: 300,
              padding: const EdgeInsets.all(8.0),
              child: TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 1000),
                //curve: Curves.easeInOutBack,
                tween: Tween(begin: 0.0, end: _valuePage.toDouble()),
                builder: (context, turn, child) {
                  return Transform.rotate(
                    alignment: Alignment.center,
                    angle: turn * 1.5,
                    child: Image(
                      width: 300,
                      image: AssetImage(planets[_valuePage].image),
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
              //color: Colors.red,
              child: Stack(
                children: [
                  const GlassBox(
                    width: double.infinity,
                    height: double.infinity,
                    radius: 30.0,
                    sigma: 2.0,
                  ),
                  Column(
                    children: [
                      AnimatedSwitcher(
                        duration: _duration,
                        child: Text(
                          key: Key(planets[_valuePage].name),
                          planets[_valuePage].name,
                          style: const TextStyle(
                              fontSize: 80, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              const Text(
                                'RADIUS',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              AnimatedSwitcher(
                                duration: _duration,
                                child: Text(
                                  key: Key(planets[_valuePage].name),
                                  planets[_valuePage].radius,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'GRAVITY',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              AnimatedSwitcher(
                                duration: _duration,
                                child: Text(
                                  key: Key(planets[_valuePage].name),
                                  planets[_valuePage].gravity,
                                  style: TextStyle(
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
                                    fontSize: 20, color: Colors.white),
                              ),
                              AnimatedSwitcher(
                                duration: _duration,
                                child: Text(
                                  key: Key(planets[_valuePage].name),
                                  planets[_valuePage].gravity,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'GRAVITY',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              AnimatedSwitcher(
                                duration: _duration,
                                child: Text(
                                  key: Key(planets[_valuePage].name),
                                  planets[_valuePage].gravity,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
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
                                top: index == _valuePage ? 40 : 70,
                                bottom: index == _valuePage ? 40 : 70,
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
