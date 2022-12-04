import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirtsPage extends StatefulWidget {
  const FirtsPage({super.key});

  @override
  State<FirtsPage> createState() => _FirtsPageState();
}

class _FirtsPageState extends State<FirtsPage> with TickerProviderStateMixin {
  final TextEditingController _textController = TextEditingController();
  late AnimationController _controllerAnimation;
  late AnimationController _controllerTextAnimation;
  late Animation _textAnimation;
  @override
  void initState() {
    _controllerAnimation = AnimationController(vsync: this, duration: const Duration(seconds: 40))
      ..repeat(reverse: true);

    _controllerTextAnimation = AnimationController(vsync: this, duration: const Duration(seconds: 10))
      ..repeat();
    _textAnimation = Tween(begin: 0.0, end: 1.0).animate(_controllerTextAnimation)
      ..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/fundo_conta.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.9,
            child: AnimatedBuilder(
              animation: Tween(
                begin: 3,
                end: 5 * pi,
              ).animate(_controllerAnimation),
              child: Stack(alignment: Alignment.center, children: [
                Positioned(
                  bottom: 10,
                  right: 100,
                  child: CircleAvatar(
                    maxRadius: MediaQuery.of(context).size.width * 0.05,
                    backgroundColor: Colors.green,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: CircleAvatar(
                    maxRadius: MediaQuery.of(context).size.width * 0.05,
                    backgroundColor: Colors.green,
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 0,
                  right: 0,
                  child: CircleAvatar(
                    maxRadius: MediaQuery.of(context).size.width * 0.05,
                    backgroundColor: Colors.green,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 100,
                  child: CircleAvatar(
                    maxRadius: MediaQuery.of(context).size.width * 0.15,
                    backgroundColor: Colors.green,
                  ),
                ),
                Positioned(
                  top: 200,
                  left: 0,
                  right: 200,
                  child: CircleAvatar(
                    maxRadius: MediaQuery.of(context).size.width * 0.1,
                    backgroundColor: Colors.green,
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 100,
                  child: CircleAvatar(
                    maxRadius: MediaQuery.of(context).size.width * 0.1,
                    backgroundColor: Colors.indigo,
                    child: Icon(
                      Icons.drive_file_rename_outline_rounded,
                      size: MediaQuery.of(context).size.height * 0.1,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 20,
                  child: CircleAvatar(
                    maxRadius: MediaQuery.of(context).size.width * 0.1,
                    backgroundColor: Colors.indigo,
                    child: Icon(
                      Icons.content_paste_go_rounded,
                      size: MediaQuery.of(context).size.width * 0.1,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: CircleAvatar(
                    maxRadius: MediaQuery.of(context).size.width * 0.1,
                    backgroundColor: Colors.indigo,
                    child: Icon(
                      Icons.content_paste_search_rounded,
                      size: MediaQuery.of(context).size.width * 0.1,
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  child: CircleAvatar(
                    maxRadius: MediaQuery.of(context).size.width * 0.2,
                    backgroundColor: Colors.indigo,
                    child: Icon(
                      Icons.content_paste_rounded,
                      size: MediaQuery.of(context).size.width * 0.2,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -0,
                  right: 0,
                  left: 0,
                  child: CircleAvatar(
                    maxRadius: MediaQuery.of(context).size.width * 0.1,
                    backgroundColor: Colors.green,
                  ),
                ),
              ]),
              builder: (context, child) {
                return Transform.rotate(
                  angle: _controllerAnimation.value,
                  child: child,
                );
              },
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.indigo.withAlpha(200),
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(70)),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                    child: ShaderMask(
                      child: Text(
                        'Seja bem Vindo,                      ',
                        maxLines: 2,
                        style: GoogleFonts.pressStart2p(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                        ),
                      ),
                      shaderCallback: (bounds) {
                        return LinearGradient(
                          stops: [
                            _textAnimation.value * 0.8,
                            _textAnimation.value * 0.8,
                            _textAnimation.value,
                          ],
                          colors: const [
                            Colors.black,
                            Colors.black,
                            Colors.transparent,
                          ],
                        ).createShader(bounds);
                      },
                    ),
                  ),
                  Card(
                    elevation: 10,
                    margin: EdgeInsets.zero,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(70))),
                    color: const Color.fromARGB(207, 207, 207, 207),
                    shadowColor: Colors.grey.shade700,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Coloque seu nome de usuário abaixo',
                            style: GoogleFonts.nerkoOne(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: MediaQuery.of(context).size.width * 0.035,
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                              width: 280,
                              height: 50,
                              child: TextField(
                                controller: _textController,
                                decoration: InputDecoration(
                                    label: Text(
                                      'Usuário',
                                      style: GoogleFonts.nerkoOne(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: MediaQuery.of(context).size.width * 0.025,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    )),
                              )),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Próximo passo',
                                style: GoogleFonts.nerkoOne(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: MediaQuery.of(context).size.width * 0.035,
                                ),
                              ),
                              Transform.rotate(
                                angle: 90 * pi / 180,
                                child: const Icon(
                                  Icons.pan_tool_alt_rounded,
                                  size: 28,
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
            ),
          ),
        ],
      ),
    );
  }
}
