import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_cycle8_sat/pages/home_page/category_view.dart';
import 'package:news_app_cycle8_sat/pages/home_page/widgets/drawer_widget.dart';
import 'package:news_app_cycle8_sat/pages/home_page/widgets/gird_view_item_widget.dart';

import '../../model/category_model.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CategoryModel> categoriesList = [
    CategoryModel(
      id: "sports",
      title: "Sports",
      image: "assets/images/sports_icon.png",
      backgroundColor: const Color(0xFFC91C22),
    ),
    CategoryModel(
      id: "politics",
      title: "Politics",
      image: "assets/images/politics_icon.png",
      backgroundColor: const Color(0xFF003E90),
    ),
    CategoryModel(
      id: "health",
      title: "Health",
      image: "assets/images/health_icon.png",
      backgroundColor: const Color(0xFFED1E79),
    ),
    CategoryModel(
      id: "business ",
      title: "Business ",
      image: "assets/images/bussines_icon.png",
      backgroundColor: const Color(0xFFCF7E48),
    ),
    CategoryModel(
      id: "enviroment",
      title: "Enviroment",
      image: "assets/images/environment_icon.png",
      backgroundColor: const Color(0xFF4882CF),
    ),
    CategoryModel(
      id: "science",
      title: "Science",
      image: "assets/images/science_icon.png",
      backgroundColor: const Color(0xFFF2D352),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage("assets/images/background_pattern.png"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            selectedCategory == null
                ? "Route News App"
                : selectedCategory!.title,
          ),
        ),
        drawer: DrawerWidet(selectedCategor: selectedCategory, onPressed: onPressed),
        body: selectedCategory == null
            ? Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pick your category \n of interest",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF4F5A69),
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12.0,
                          crossAxisSpacing: 12.0,
                          childAspectRatio: 7 / 8,
                        ),
                        itemBuilder: (context, index) => GridViewItemWidget(
                          categoryModel: categoriesList[index],
                          onClicked: onClicked,
                          index: index,
                        ),
                        itemCount: categoriesList.length,
                      ),
                    ),
                  ],
                ),
              )
            : CategoryView(selected : selectedCategory!),
      ),
    );
  }

  CategoryModel? selectedCategory;

  onClicked(CategoryModel categoryModel) {
    print("hellooo ya shabab ...${categoryModel.title}");
    selectedCategory = categoryModel;
    setState(() {});
  }

  onPressed() {
    setState(() {
      selectedCategory = null;
      Navigator.pop(context);
      print("Heloo");
    });
  }
}
