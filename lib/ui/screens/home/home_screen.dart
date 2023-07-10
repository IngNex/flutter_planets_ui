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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/planets/galaxia.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 20),
              child: Text(
                'Planet',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: TweenAnimationBuilder<double>(
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeInOutBack,
                  tween: Tween(begin: 0.0, end: _valuePage.toDouble()),
                  builder: (context, turn, child) {
                    return Transform.rotate(
                      alignment: Alignment.center,
                      angle: turn * 2,
                      child: Image(
                        image: AssetImage(planets[_valuePage].image),
                      ),
                    );
                  },
                ),
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
                        top: index == _valuePage ? 40 : 100,
                        bottom: index == _valuePage ? 40 : 100),
                    child: SvgPicture.asset(planets[index].picture),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(
                    36,
                  ),
                ),
              ),
              child: Column(
                children: [
                  Text(_valueSwitch.toString()),
                  Text('Planets'),
                  Text('Planets'),
                  Text('Planets'),
                  Text('Planets'),
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
