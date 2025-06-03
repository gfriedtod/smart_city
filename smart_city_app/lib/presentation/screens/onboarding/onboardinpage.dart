import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_city_app/core/constants/route.dart';

import '../../../fake_core/data/onboarding_data.dart';
import '../../components/button_comp.dart';
import '../register/SignupPage.dart';
import 'color.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = OnboardingData();
  final pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueAccent,
      body: Column(children: [body(), buildDots(), button()]),
    );
  }

  //Body
  Widget body() {
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        itemCount: controller.items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 00),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Images
                ClipPath(
                  clipper: CustomBottomClipper(),
                  child: Image.asset(
                    controller.items[currentIndex].image,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.60,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),

                //Tittles
                Text(
                  controller.items[currentIndex].title,
                  style: const TextStyle(
                    fontSize: 28,
                    color: Color(0xFF1A1A1A),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

                //Description
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    controller.items[currentIndex].description,
                    style: const TextStyle(color: Colors.black87, fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  //Dots
  Widget buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        controller.items.length,
        (index) => AnimatedContainer(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: currentIndex == index ? primaryColor : Colors.grey,
          ),
          height: 7,
          width: currentIndex == index ? 30 : 7,
          duration: Duration(milliseconds: 700),
        ),
      ),
    );
  }

  //Button
  Widget button() {
    var title = currentIndex == controller.items.length - 1
        ? "Get Started"
        : "Continue";
    onPressed() {
      if (currentIndex == controller.items.length - 1) {
        context.push(RoutesPath.signin.path);
      } else {
        pageController.nextPage(
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeIn,
        );
      }
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ButtonComp(
        width: MediaQuery.of(context).size.width * 0.9,
        title: title,
        onPressed: onPressed,
      ),
    );
  }
}

class CustomBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 110);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 50,
      size.width + 10,
      size.height - 21,
    );
    path.lineTo(size.width, 0);
    path.close(); // Ferme le chemin
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
