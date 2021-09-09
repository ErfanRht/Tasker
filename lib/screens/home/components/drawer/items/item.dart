import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeDrawerItem extends StatelessWidget {
  String title;
  IconData icon;
  Function onTap;
  HomeDrawerItem(
      {@required this.title, @required this.icon, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: Colors.transparent,
      splashColor: Colors.white.withOpacity(0.3),
      child: Container(
          padding: EdgeInsets.only(top: 12.5, bottom: 12.5, left: 40),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.white.withOpacity(0.925),
                size: 17.5,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                title,
                style: GoogleFonts.ubuntu(
                  color: Colors.white.withOpacity(0.925),
                  fontWeight: FontWeight.w600,
                  fontSize: 17.5,
                ),
              ),
            ],
          )),
    );
  }
}
