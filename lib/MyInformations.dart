import 'dart:developer';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'Contact.dart';
import 'EducationPage.dart';
import 'ExperincesPage.dart';
import 'HobbiesPage.dart';
import 'OverviewPage.dart';
import 'ProjectsPage.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final NotchBottomBarController _controller =
      NotchBottomBarController(index: 0);

  int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// widget list
    final List<Widget> bottomBarPages = [
      Page1(
        controller: (_controller),
      ),
      const Page2(),
      const Page3(),
      const Page4(),
      const Page5(),
    ];
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              itemLabelStyle: const TextStyle(
                fontSize: 10,
                color: Colors.white, // Change label color to white
              ),

              /// Provide NotchBottomBarController
              notchBottomBarController: _controller,
              color: Color.fromARGB(255, 138, 221, 161),
              showLabel: true,

              // notchShader: const SweepGradient(
              //   startAngle: 0,
              //   endAngle: pi / 2,
              //   colors: [Colors.red, Colors.green, Colors.orange],
              //   tileMode: TileMode.mirror,
              // ).createShader(Rect.fromCircle(center: Offset.zero, radius: 8.0)),
              notchColor: Colors.black87,

              /// restart app if you change removeMargins
              removeMargins: false,
              bottomBarWidth: 500,
              showShadow: false,
              durationInMilliSeconds: 300,

              bottomBarItems: [
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.person_search_outlined,
                    color: Colors.white,
                  ),
                  activeItem: Icon(
                    Icons.person_search_outlined,
                    color: Color.fromARGB(255, 138, 221, 161),
                  ),
                  itemLabel: 'overview'.tr(),
                ),
                BottomBarItem(
                  inActiveItem: Icon(Icons.school, color: Colors.white),
                  activeItem: Icon(
                    Icons.school,
                    color: Color.fromARGB(255, 138, 221, 161),
                  ),
                  itemLabel: 'Education'.tr(),
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.work_history,
                    color: Colors.white,
                  ),
                  activeItem: Icon(
                    Icons.work_history,
                    color: Color.fromARGB(255, 138, 221, 161),
                  ),
                  itemLabel: 'Experience'.tr(),
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.palette,
                    color: Colors.white,
                  ),
                  activeItem: Icon(
                    Icons.palette,
                    color: Color.fromARGB(255, 138, 221, 161),
                  ),
                  itemLabel: 'Hobbies'.tr(),
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.contact_page,
                    color: Colors.white,
                  ),
                  activeItem: Icon(
                    Icons.contact_page,
                    color: Color.fromARGB(255, 138, 221, 161),
                  ),
                  itemLabel: 'Contact'.tr(),
                ),
              ],
              onTap: (index) {
                log('current selected index $index');
                _pageController.jumpToPage(index);
              },
            )
          : null,
    );
  }
}

/// add controller to check weather index through change or not. in page 1
class Page1 extends StatelessWidget {
  final NotchBottomBarController? controller;

  const Page1({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverviewPage();
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EducationPage();
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExperiencePage();
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HobbiesPage();
  }
}

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContactPage();
  }
}

class Page6 extends StatelessWidget {
  const Page6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProjectsPage();
  }
}
