import 'package:ecommerce_app/pages/login.dart';
import 'package:ecommerce_app/widget/content_model.dart';
import 'package:ecommerce_app/widget/widget_support.dart';
import 'package:flutter/material.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                    controller: _controller,
                    itemCount: contents.length,
                    onPageChanged: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemBuilder: (_, i) {
                      return Padding(
                        padding: EdgeInsets.only(
                            top: 100.0, left: 20.0, right: 20.0),
                        child: Column(
                          children: [
                            Image.asset(
                              contents[i].image,
                              height: 370,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              contents[i].title,
                              style: AppWidget.HeadLineTextFieldStyle(),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              contents[i].description,
                              style: AppWidget.LightTextFieldStyle(),
                            )
                          ],
                        ),
                      );
                    }),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    contents.length,
                    (index) => buildDot(index, context),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (currentIndex == contents.length - 1) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LogIn()));
                  } else {
                    _controller.nextPage(
                        duration: Duration(milliseconds: 100),
                        curve: Curves.bounceIn);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 27, 105, 10),
                      borderRadius: BorderRadius.circular(40)),
                  height: 60,
                  margin: EdgeInsets.all(40),
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      currentIndex == contents.length - 1
                          ? "Get Started!"
                          : "Next",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
          Positioned(
            top: 60,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => LogIn()));
              },
              child: Row(
                children: [
                  Text(
                    "Skip",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10.0,
      width: currentIndex == index ? 18 : 7,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: Colors.black),
    );
  }
}
