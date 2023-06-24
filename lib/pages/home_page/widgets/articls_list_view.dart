import 'package:flutter/material.dart';
import 'package:news_app_cycle8_sat/model/articl_model.dart';
import 'package:news_app_cycle8_sat/pages/home_page/widgets/article_view_item.dart';
import 'package:news_app_cycle8_sat/shared_component/network/api_manager.dart';

class ArticlsListView extends StatelessWidget {
  String sourceId;

  ArticlsListView(this.sourceId);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArticlModel>(
      future: ApiManager.fetchNewsList(sourceId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Column(
            children: [
              Text("${snapshot.error}"),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.refresh_outlined),
              ),
            ],
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          var articlList = snapshot.data?.articles ?? [];
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ArticlView(articlList[index]);
              },
              itemCount: articlList.length,
            ),
          );
        }
      },
    );
  }
}
