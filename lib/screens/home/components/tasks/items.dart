import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ms_undraw/ms_undraw.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/controllers/controller.dart';
import 'package:todo/screens/home/components/tasks/item.dart';

class HomeTasksItems extends StatefulWidget {
  @override
  _HomeTasksItemsState createState() => _HomeTasksItemsState();
}

class _HomeTasksItemsState extends State<HomeTasksItems> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (_) {
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 0),
          child: _.tasks.length != 0
              ? ListView.builder(
                  reverse: true,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: _.tasks.length,
                  itemBuilder: (context, index) {
                    return TasksItem(
                      index: index,
                    );
                  },
                )
              : Container(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      "You have no task for today!",
                      style: GoogleFonts.ubuntu(
                          color: kSecondaryColor,
                          fontSize: 22.2,
                          fontWeight: FontWeight.w700),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 50, right: 50),
                      child: UnDraw(
                        height: MediaQuery.of(context).size.width - 100,
                        color: kSecondaryColor,
                        illustration: UnDrawIllustration.empty,
                        placeholder: Padding(
                          padding: EdgeInsets.only(top: 100),
                          child: SpinKitDoubleBounce(
                            color: kSecondaryColor,
                            size: 75,
                          ),
                        ),
                        errorWidget: Icon(Icons.error_outline,
                            color: Colors.red, size: 50),
                      ),
                    ),
                  ],
                )),
        );
      },
    );
  }
}
