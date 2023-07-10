import 'package:flutter/material.dart';
import 'package:flutter_planets_ui/data/memory/in_memory_planets.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/planets/star.png'),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            const Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 20),
              child: Text(
                'SPACE TOUR',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 300,
              padding: const EdgeInsets.all(20),
              child: TweenAnimationBuilder<double>(
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOutBack,
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
                        top: index == _valuePage ? 40 : 80,
                        bottom: index == _valuePage ? 40 : 80),
                    child: SvgPicture.asset(planets[index].picture),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'AGE',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    '+5 BILLIONS YEARS',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Text(
                    'STAR TYPE',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    'YELLOW STAR',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Text(
                    'RADIUS',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    '6.051 km',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Text(
                    'GRAVITY',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    '8.87 m/s2',
                    style: TextStyle(fontSize: 16, color: Colors.white),
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
      ),
    );
  }
}
