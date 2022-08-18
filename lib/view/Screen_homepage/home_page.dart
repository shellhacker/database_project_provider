import 'package:database_project/controller/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BottomNavigationBarProvider.pages[
          Provider.of<BottomNavigationBarProvider>(context)
              .currentSelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: Provider.of<BottomNavigationBarProvider>(context)
              .currentSelectedIndex,
          onTap: (newindex) {
            // context.read<BottomNavigationBarProvider>().changeBottomBar(newindex);
            Provider.of<BottomNavigationBarProvider>(context, listen: false)
                .changeBottomBar(newindex);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List')
          ]),
    );
  }
}
