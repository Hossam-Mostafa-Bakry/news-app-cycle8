import 'package:flutter/material.dart';
import 'package:news_app_cycle8_sat/model/source_model.dart';
import 'package:news_app_cycle8_sat/pages/home_page/widgets/tab_item.dart';

import 'widgets/articls_list_view.dart';

class TabBarListView extends StatefulWidget {

  List<Sources> sources;
  TabBarListView(this.sources);

  @override
  State<TabBarListView> createState() => _TabBarListViewState();
}

class _TabBarListViewState extends State<TabBarListView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          DefaultTabController(
            initialIndex: selectedIndex,
            length: widget.sources.length ?? 0,
            child: TabBar(
              labelPadding: const EdgeInsets.symmetric(horizontal: 6),
              indicator: const BoxDecoration(),
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              isScrollable: true,
              tabs: widget.sources.map((element) {
                    return TabItem(
                        element,
                        selectedIndex ==
                            widget.sources.indexOf(element));
                  }).toList() ??
                  [],
            ),
          ),
          ArticlsListView(widget.sources[selectedIndex].id ?? ""),
        ],
      ),
    );
  }
}
