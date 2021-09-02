import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/controllers/controller.dart';
import 'package:todo/models/tasks.dart';

class TasksItem extends StatefulWidget {
  final int index;
  TasksItem({@required this.index});
  @override
  _TasksItemState createState() => _TasksItemState();
}

class _TasksItemState extends State<TasksItem> {
  SlidableController slidableController;

  bool _visible, _delete;

  void handleSlideAnimationChanged(Animation<double> slideAnimation) {
    setState(() {});
  }

  void handleSlideIsOpenChanged(bool isOpen) {
    setState(() {
      _delete = isOpen;
      if (isOpen) {
        _removeTask();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _visible = false;
    _delete = false;
    slidableController = SlidableController(
      onSlideAnimationChanged: handleSlideAnimationChanged,
      onSlideIsOpenChanged: handleSlideIsOpenChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (_) {
      return Padding(
          padding: EdgeInsets.only(top: 10),
          child: Slidable(
            controller: slidableController,
            actionPane: SlidableBehindActionPane(),
            actionExtentRatio: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 75,
              margin: EdgeInsets.only(left: 25, right: 25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 0.001,
                    )
                  ],
                  color: Colors.white),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Transform.scale(
                      scale: 1.2,
                      child: CircularCheckBox(
                        activeColor: Colors.grey,
                        inactiveColor: kSecondaryColor,
                        checkColor: Colors.white,
                        value: _visible,
                        onChanged: (value) {
                          setState(() {
                            _visible = !_visible;
                          });
                        },
                      ),
                    ),
                  ),
                  Text(
                    _.tasks[widget.index][0],
                    style: GoogleFonts.ubuntu(
                      color: _visible ? Colors.grey : kSecondaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 17.5,
                      decoration: _visible ? TextDecoration.lineThrough : null,
                    ),
                  )
                ],
              ),
            ),
            secondaryActions: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 75,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: kBackgroundColor),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: EdgeInsets.only(left: 12.5, right: 5),
                    child: Icon(
                      FontAwesomeIcons.trashAlt,
                      color: Colors.grey,
                      size: 22.5,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 10),
                    child: Text(
                      'The task was deleted',
                      style: GoogleFonts.ubuntu(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 17.5,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: kBackgroundColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.75),
                              blurRadius: 1,
                            )
                          ]),
                      child: Center(
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            'UNDO',
                            style: GoogleFonts.ubuntu(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
              )
            ],
          ));
    });
  }

  _removeTask() async {
    await Future.delayed(Duration(milliseconds: 5000));
    if (_delete) {
      setState(() {
        _delete = false;
      });
      removeTask(widget.index);
    }
  }
}
