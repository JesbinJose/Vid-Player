import 'package:flutter/material.dart';
import 'package:play_video/utils/styles/my_color_style.dart';
import 'package:play_video/widgets/search/search_list_tile.dart';

class SearchItems extends SearchDelegate {
  SearchItems({required this.videoPaths});
  final List<String> videoPaths;

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme:  AppBarTheme(
        elevation: 0,
        color: MyColors.primaryColor,
        //app bar color I wanted
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(
          Icons.clear,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.of(context).pop(),
      icon: const Icon(
        Icons.arrow_back,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> temp = [];
    for (int i = 0; i < videoPaths.length; i++) {
      final String name = videoPaths[i].split('/').last.split('/').first;
      if (name.toLowerCase().contains(query.toLowerCase())) {
        temp.add(videoPaths[i]);
      }
    }
    if (temp.isNotEmpty) {
      return Scaffold(
        backgroundColor: MyColors.backgroundColor,
        body: ListView.separated(
          separatorBuilder: (_, __) =>  Divider(
            color: MyColors.primaryColor,
          ),
          itemCount: temp.length,
          itemBuilder: (context, index) => SearchListTile(
            videoPaths: videoPaths,
            index: index,
            path: temp[index],
          ),
        ),
      );
    }
    return const ListTile(
      title: Text('No Result'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> temp = [];
    for (int i = 0; i < videoPaths.length; i++) {
      final String name = videoPaths[i].split('/').last.split('/').first;
      if (name.toLowerCase().contains(query.toLowerCase())) {
        temp.add(videoPaths[i]);
      }
    }
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: ListView.separated(
        separatorBuilder: (_, __) =>  Divider(
          color: MyColors.primaryColor,
        ),
        itemCount: temp.length,
        itemBuilder: (context, index) => SearchListTile(
          videoPaths: videoPaths,
          index: index,
          path: temp[index],
        ),
      ),
    );
  }
}
