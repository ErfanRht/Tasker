import 'package:flutter/material.dart';

class HomeTasks extends StatefulWidget {
  @override
  _HomeTasksState createState() => _HomeTasksState();
}

class _HomeTasksState extends State<HomeTasks> {
  double _opacity;
  Duration _animationDuration;
  @override
  void initState() {
    super.initState();
    _opacity = 0.0;
    _animationDuration = Duration(milliseconds: 500);
    _animationController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50.0, left: 25, right: 25),
      child: Column(
        children: [
          Row(
            children: [
              AnimatedOpacity(
                duration: _animationDuration,
                opacity: _opacity,
                child: Text(
                  "TODAY'S TASKS",
                  style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.3)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _animationController() async {
    await Future.delayed(Duration(milliseconds: 2500));
    setState(() {
      _opacity = 1.0;
    });
  }
}
