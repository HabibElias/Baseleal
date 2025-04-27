import 'package:baseleal/elements/custom_bottom_nav.dart';
import 'package:baseleal/pages/about_page.dart';
import 'package:baseleal/pages/gallery_page.dart';
import 'package:baseleal/pages/home_page.dart';
import 'package:baseleal/pages/lyrics_page.dart';
import 'package:flutter/material.dart';

class AllPages extends StatefulWidget {
  const AllPages({super.key});

  @override
  State<AllPages> createState() => _AllPagesState();
}

class _AllPagesState extends State<AllPages> {
  int _selectedIndex = 0;

  navigateTo(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomePage(navigateTo: navigateTo),
      const GalleryPage(),
      const LyricsPage(),
      const AboutPage(),
    ];
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNav(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      ),
    );
  }
}
