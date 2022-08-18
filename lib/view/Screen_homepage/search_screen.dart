import 'package:database_project/controller/search_result.dart';
import 'package:database_project/view/Screen_homepage/show_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({Key? key}) : super(key: key);

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
              color: Colors.blue.shade200,
              borderRadius: BorderRadius.circular(30)),
          child: TextField(
            onTap: () {},
            onChanged: (String? value) {
              Provider.of<SearchResultProvider>(context, listen: false)
                  .searchAllStudent(value, context);
            },
            controller: searchController,
            decoration: const InputDecoration(
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.all(15),
                hintText: 'Search'),
          ),
        ),
      ),
      body: SafeArea(child: Consumer<SearchResultProvider>(
        builder: (context, value, child) {
          return ListView.separated(
              itemBuilder: (ctx, index) {
                final data = value.temp[index];
                return ListTile(
                  title: Text(data.name),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => ShowScreen(
                          data: data,
                          index: index,
                        ),
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (ctx, index) {
                return const Divider();
              },
              itemCount: value.temp.length);
        },
      )),
    );
    // );
  }
}
