import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_cycle8_sat/model/category_model.dart';
import 'package:news_app_cycle8_sat/shared_component/theme/colors.dart';

import 'drawer_item.dart';

class DrawerWidet extends StatelessWidget {
  CategoryModel? selectedCategor;
  Function? onPressed;

  DrawerWidet({
    required this.selectedCategor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: mediaQuery.width * 0.8,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: mediaQuery.height * 0.2,
              color: primaryColor,
              child: Text(
                "News App!",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Draweritem(
              title: "Categories",
              iconData: Icons.list,
              onClick: () {
                if(onPressed != null) {
                  onPressed!();
                }
                // Todo make selected Category equal null call back Function
              },
            ),
            Draweritem(
              title: "Settings",
              iconData: Icons.settings,
              onClick: () {
                // Todo make selected Category equal null call back Function
              },
            ),
          ],
        ),
      ),
    );
  }
}
