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
  double _valueSwitch = 0.0;
  int _valuePage = 0;
  double _currentPage = 0.0;
  final _pageController = PageController(viewportFraction: 0.35);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 28, 28),
      body: Column(
        children: [
          // Positioned(
          //   top: -20,
          //   left: -20,
          //   right: -20,
          //   bottom: -20,
          //   child: Container(
          //     decoration: BoxDecoration(
          //         image: DecorationImage(
          //             image: AssetImage('assets/planets/picture.png'),
          //             fit: BoxFit.cover)),
          //     child: Transform.rotate(
          //       angle: 50,
          //     ),
          //   ),
          // ),
          const Padding(
            padding: EdgeInsets.only(top: 50, bottom: 20),
            child: Row(
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
          Container(
            height: 300,
            padding: const EdgeInsets.all(8.0),
            child: TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 1500),
              //curve: Curves.easeInOutBack,
              tween: Tween(begin: 0.0, end: _valuePage.toDouble()),
              builder: (context, turn, child) {
                return Transform.rotate(
                  alignment: Alignment.center,
                  angle: turn * 2,
                  child: Image(
                    width: 300,
                    image: AssetImage(planets[_valuePage].image),
                  ),
                );
              },
            ),
          ),
          AnimatedSwitcher(
            duration: _duration,
            child: Text(
              key: Key(planets[_valuePage].name),
              planets[_valuePage].name,
              style: const TextStyle(fontSize: 80, color: Colors.white),
            ),
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
              physics:
                  const BouncingScrollPhysics(parent: ClampingScrollPhysics()),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: EdgeInsets.only(
                      top: index == _valuePage ? 40 : 80,
                      bottom: index == _valuePage ? 40 : 80),
                  child: SvgPicture.asset(planets[index].picture),
                );
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Row(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text(
                      'RADIUS',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    AnimatedSwitcher(
                      duration: _duration,
                      child: Text(
                        key: Key(planets[_valuePage].name),
                        planets[_valuePage].radius,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'GRAVITY',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    AnimatedSwitcher(
                      duration: _duration,
                      child: Text(
                        key: Key(planets[_valuePage].name),
                        planets[_valuePage].gravity,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'GRAVITY',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    AnimatedSwitcher(
                      duration: _duration,
                      child: Text(
                        key: Key(planets[_valuePage].name),
                        planets[_valuePage].gravity,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'GRAVITY',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    AnimatedSwitcher(
                      duration: _duration,
                      child: Text(
                        key: Key(planets[_valuePage].name),
                        planets[_valuePage].gravity,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
          // Positioned(
          //   left: 0,
          //   child: RotatedBox(
          //     quarterTurns: 1,
          //     child: Slider(
          //       min: 0,
          //       max: 5,
          //       value: _valueSwitch,
          //       onChanged: (value) {
          //         setState(() {
          //           _valueSwitch = value;
          //         });
          //       },
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
