import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/models/tasks.dart';

class RemoveAllTasksDialog extends StatelessWidget {
  bool _isDark;
  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    _isDark = brightnessValue == Brightness.dark;
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          backgroundColor: _isDark ? kDarkBackgroundColor2 : kBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            "Are you sure?",
            style: GoogleFonts.ubuntu(
                fontSize: 22.5,
                fontWeight: FontWeight.w600,
                color: _isDark ? kBackgroundColor : kDarkBackgroundColor),
          ),
          content: Text(
            "All tasks will be deleted.",
            style: GoogleFonts.ubuntu(
                fontSize: 17.5,
                fontWeight: FontWeight.w500,
                color: _isDark
                    ? kBackgroundColor.withOpacity(0.8)
                    : kDarkBackgroundColor.withOpacity(0.8)),
          ),
          actions: [
            FlatButton(
              child: Text(
                "Cancel",
                style: GoogleFonts.ubuntu(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: _isDark
                        ? kBackgroundColor.withOpacity(0.9)
                        : kDarkBackgroundColor),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text(
                "Delete",
                style: GoogleFonts.ubuntu(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.redAccent),
              ),
              onPressed: () {
                removeAllTasks();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
