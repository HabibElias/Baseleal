import 'package:baseleal/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomNav extends StatefulWidget {
  final int selectedIndex;
  final Function onItemSelected;
  const CustomBottomNav({
    required this.onItemSelected,
    required this.selectedIndex,
    super.key,
  });

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 61,
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 13),
        decoration: BoxDecoration(
          color: Provider.of<ThemeProvider>(context, listen: false).isLightmode
              ? const Color(0xffF8F7F7)
              : const Color(0xff464646),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(Icons.home_rounded, 0),
              _buildNavItem(Icons.image_rounded, 1),
              _buildNavItem(Icons.lyrics_rounded, 2),
              _buildNavItem(Icons.info_rounded, 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () => widget.onItemSelected(index),
      child: Icon(
        icon,
        size: 35,
        color: widget.selectedIndex == index
            ? Theme.of(context).colorScheme.secondary
            : Provider.of<ThemeProvider>(context, listen: false).isLightmode
                ? const Color(0xff9E9E9E)
                : const Color(0xffbfbfbf),
      ),
    );
  }
}
