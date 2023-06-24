import 'package:flutter/material.dart';
import 'package:news_app_cycle8_sat/model/category_model.dart';
import 'package:news_app_cycle8_sat/pages/home_page/tab_bar_list_view.dart';
import 'package:news_app_cycle8_sat/pages/home_page/widgets/tab_item.dart';
import 'package:news_app_cycle8_sat/shared_component/network/api_manager.dart';

import '../../model/source_model.dart';

class CategoryView extends StatefulWidget {
  CategoryModel selected;

  CategoryView({Key? key, required this.selected}) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  late Future<SourceModel> fetchSources;

  @override
  void initState() {
    fetchSources = ApiManager.fetchSources(widget.selected.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceModel>(
      future: fetchSources,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Column(
            children: [
              Text("${snapshot.error}"),
              IconButton(
                onPressed: () {
                  fetchSources;
                },
                icon: Icon(Icons.refresh_outlined),
              ),
            ],
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          SourceModel? source = snapshot.data;
          return TabBarListView(source!);

        }
      },
    );
  }
}
