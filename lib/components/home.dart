import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  Function changeToBold;
  bool boldStatus;

  Home(this.changeToBold, this.boldStatus, {super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    bool isBold = widget.boldStatus;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Column(
              children: [
                const Text(
                  "Dyslexia Friendly",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                Switch(
                    value: isBold,
                    onChanged: (val) {
                      isBold = val;
                      widget.changeToBold(isBold);
                    }),
              ],
            ),
          ),
          Row(
            children: [
              const CircleAvatar(
                radius: 40,
                child: Image(
                  image: AssetImage("lib/assets/img/profile_img.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    isBold
                        ? const Text('Hello Danish!',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ))
                        : const Text('Hello Danish!',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                            )),
                    isBold
                        ? const Text(
                            '27 April 2023',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold),
                          )
                        : const Text('27 April 2023',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                            )),
                  ],
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: (MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top) *
                0.6,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(210, 145, 255, 40),
                borderRadius: BorderRadius.circular(6)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.all(10),
                          height: 150,
                          width: 180,
                          child: Card(
                            elevation: 3,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Image(
                                    image: AssetImage(
                                        'lib/assets/img/sightSaver.png'),
                                    fit: BoxFit.cover,
                                    height: 85,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  isBold
                                      ? const Text(
                                          'Sight Saver',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        )
                                      : const Text(
                                          'Sight Saver',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 18),
                                        ),
                                ]),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
