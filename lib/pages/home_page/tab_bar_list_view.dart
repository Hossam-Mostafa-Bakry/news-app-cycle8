import 'package:flutter/material.dart';
import 'package:news_app_cycle8_sat/model/source_model.dart';
import 'package:news_app_cycle8_sat/pages/home_page/widgets/tab_item.dart';

import 'widgets/articls_list_view.dart';

class TabBarListView extends StatefulWidget {
  SourceModel sourceModell;

  TabBarListView(this.sourceModell);

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
            length: widget.sourceModell.sources?.length ?? 0,
            child: TabBar(
              labelPadding: const EdgeInsets.symmetric(horizontal: 6),
              indicator: const BoxDecoration(),
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              isScrollable: true,
              tabs: widget.sourceModell.sources?.map((element) {
                    return TabItem(
                        element,
                        selectedIndex ==
                            widget.sourceModell.sources!.indexOf(element));
                  }).toList() ??
                  [],
            ),
          ),
          ArticlsListView(widget.sourceModell.sources?[selectedIndex].id ?? ""),
        ],
      ),
    );
  }
}
