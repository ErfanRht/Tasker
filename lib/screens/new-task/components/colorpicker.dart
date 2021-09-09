import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/constants/task-colors.dart';
import 'package:todo/controllers/new-task/newtask-controller.dart';

class NewTaskColorPicker extends StatefulWidget {
  @override
  _NewTaskColorPickerState createState() => _NewTaskColorPickerState();
}

class _NewTaskColorPickerState extends State<NewTaskColorPicker> {
  int selectedColor;
  @override
  void initState() {
    super.initState();
    selectedColor = Get.find<NewTaskController>().colorNum;
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text(
            "Set a color for this task:",
            style: GoogleFonts.ubuntu(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18),
          ),
          content: Container(
            width: MediaQuery.of(context).size.width,
            height: 240,
            child: GridView.builder(
              physics: ScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 75,
                crossAxisSpacing: 25,
                mainAxisSpacing: 10,
              ),
              itemCount: colors.length,
              itemBuilder: (context, index) {
                return item(index, colors[index]);
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Cancel",
                style: GoogleFonts.ubuntu(
                    color: kSecondaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.find<NewTaskController>().updateNewTask(
                    newColor: colors[selectedColor],
                    newColorNum: selectedColor);
                Navigator.pop(context);
              },
              child: Text(
                "Change",
                style: GoogleFonts.ubuntu(
                    color: kSecondaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget item(int index, Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = index;
        });
      },
      child: Center(
        child: Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 150),
            opacity: selectedColor == index ? 1 : 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Icon(
                    Icons.check_circle_outline_rounded,
                    color: Colors.white,
                    size: 33.3,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
