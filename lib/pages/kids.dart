import 'package:flutter/material.dart';

class KidsScreen extends StatelessWidget {
  const KidsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.15),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 70),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF255F81), // Start color
                            Color(0xFF08141B), // End color
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 90),
                          child: Column(
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    const Text(
                                      "Brandon White",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Rubik"),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text("8 weeks 6 days",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        )),
                                    const SizedBox(height: 10),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text("2021-Jan-2",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16,
                                              )),
                                          const SizedBox(width: 10),
                                          Container(
                                            width: 7,
                                            height: 7,
                                            decoration: const BoxDecoration(
                                              color: Colors.grey,
                                              shape: BoxShape.circle,
                                            ),
                                            child: null,
                                          ),
                                          const SizedBox(width: 10),
                                          const Text("Boy",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16,
                                              )),
                                        ])
                                  ],
                                ),
                              )
                            ],
                          )),
                    ),
                    Positioned(
                      top: 0,
                      left: MediaQuery.of(context).size.width * 0.5 - 70,
                      child: const CircleAvatar(
                        backgroundImage:
                            NetworkImage("https://robohash.org/dahlsdhkalsd"),
                        radius: 70,
                      ),
                    ),
                  ],
                ))));
  }
}
