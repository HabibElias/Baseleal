import 'package:baseleal/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutUs extends StatelessWidget {
  final Function(int) navigateTo;
  const AboutUs({
    required this.navigateTo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GestureDetector(
        onTap: () => navigateTo(3),
        child: Container(
          width: double.maxFinite,
          height: 83,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'lib/images/photo_2024-08-28_23-36-12.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Row of butons with gesture_detector
              // Container

              Container(
                height: double.maxFinite,
                width: double.maxFinite,
                color: Provider.of<ThemeProvider>(context, listen: false)
                        .isLightmode
                    ? Theme.of(context).colorScheme.secondary.withOpacity(0.7)
                    : const Color.fromRGBO(0, 0, 0, 0.5),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 17,
                  horizontal: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withOpacity(0.65),
                        ),
                        child: Center(
                          child: Text(
                            'About Us',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontFamily: 'poppins',
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(0.65),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.info_outline_rounded,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // an image
            ],
          ),
        ),
      ),
    );
  }
}
