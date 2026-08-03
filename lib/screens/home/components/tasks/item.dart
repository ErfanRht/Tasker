import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/constants/task-colors.dart';
import 'package:todo/controllers/main-controller.dart';
import 'package:todo/models/tasks.dart';

class TasksItem extends StatefulWidget {
  final int index;
  TasksItem({required this.index});
  @override
  _TasksItemState createState() => _TasksItemState();
}

class _TasksItemState extends State<TasksItem> with TickerProviderStateMixin {
  late final SlidableController slidableController = SlidableController(this);
  double? _opacity;

  @override
  void initState() {
    super.initState();
    _opacity = 0;
    _animationController();
  }

  bool? _isDark;

  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    _isDark = brightnessValue == Brightness.dark;

    return GetBuilder<MainController>(builder: (_) {
      // حماية لو الـ index بقى خارج الحدود بعد الحذف
      if (widget.index >= _.tasks.length) {
        return SizedBox.shrink();
      }

      return AnimatedOpacity(
        opacity: _opacity!,
        duration: Duration(milliseconds: 500),
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Slidable(
            controller: slidableController,
            key: Key("${_.tasks[widget.index][0]}${widget.index}"),
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(onDismissed: () {
                _removeTaskInstantly();
              }),
              children: [
                CustomSlidableAction(
                  onPressed: (context) {
                    _removeTaskInstantly();
                  },
                  backgroundColor: Colors.transparent,
                  child: deleteBox(),
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(onDismissed: () {
                _removeTaskInstantly();
              }),
              children: [
                CustomSlidableAction(
                  onPressed: (context) {
                    _removeTaskInstantly();
                  },
                  backgroundColor: Colors.transparent,
                  child: deleteBox(),
                ),
              ],
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              margin: EdgeInsets.only(left: 25, right: 25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 0.001,
                    )
                  ],
                  color:
                      _isDark ?? false ? kDarkBackgroundColor : Colors.white),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Transform.scale(
                      scale: 1.2,
                      child: Checkbox(
                        activeColor: Colors.grey,
                        checkColor: Colors.white,
                        value: _.tasks[widget.index][2] == 'done',
                        onChanged: (value) {
                          updateTask(index: widget.index);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      _.tasks[widget.index][0],
                      style: GoogleFonts.ubuntu(
                        color: _.tasks[widget.index][2] == 'done'
                            ? Colors.grey
                            : _isDark ?? false
                                ? Colors.white
                                : colors[int.parse(_.tasks[widget.index][1])],
                        fontWeight: FontWeight.w500,
                        fontSize: 17.5,
                        decoration: _.tasks[widget.index][2] == 'done'
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget deleteBox() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), color: Colors.red),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 12.5, right: 5),
            child: FaIcon(
              FontAwesomeIcons.trashCan,
              color: _isDark ?? false ? Colors.white : Colors.grey,
              size: 22.5,
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
                  onTap: () {
                    slidableController.close();
                  },
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
        ],
      ),
    );
  }

  _animationController() async {
    await Future.delayed(Duration(milliseconds: 2000));
    if (mounted) {
      await Future.delayed(Duration(
          milliseconds:
              500 * (Get.find<MainController>().tasks.length - widget.index)));
      setState(() {
        _opacity = 1;
      });
    }
  }


  void _removeTaskInstantly() {
    removeTask(index: widget.index);
  }
}
