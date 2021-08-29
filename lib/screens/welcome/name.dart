import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/constants/colors.dart';

class WelcomeName extends StatefulWidget {
  @override
  _WelcomeNameState createState() => _WelcomeNameState();
}

class _WelcomeNameState extends State<WelcomeName> {
  Duration _animationSpeed;
  double _opacity;
  EdgeInsets _padding;

  @override
  void initState() {
    super.initState();
    _opacity = 0.0;
    _animationSpeed = Duration(milliseconds: 666);
    _padding = EdgeInsets.only(top: 33);

    animationController();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: _animationSpeed,
      child: AnimatedPadding(
        duration: _animationSpeed,
        padding: _padding,
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 100,
          child: Column(
            children: [
              Text("What's your name?",
                  style: GoogleFonts.ubuntu(
                      color: kSecondaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w700)),
              TextField(
                  textAlign: TextAlign.center,
                  maxLength: 25,
                  style: GoogleFonts.workSans(
                      color: kSecondaryColor, fontWeight: FontWeight.w700),
                  cursorColor: kSecondaryColor,
                  cursorHeight: 25,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: kSecondaryColor)),
                    counterText: '',
                    hintText: "What's your name? ",
                  ),
                  onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }

  animationController() async {
    await Future.delayed(Duration(milliseconds: 2500));
    setState(() {
      _opacity = 1.0;
      _padding = EdgeInsets.zero;
    });
    // await Future.delayed(Duration(milliseconds: 2000));
    // setState(() {
    //   _opacity = 0.0;
    //   _padding = EdgeInsets.only(top: 33);
    // });
  }
}
