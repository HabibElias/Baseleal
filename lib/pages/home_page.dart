import 'package:baseleal/elements/about_us.dart';
import 'package:baseleal/elements/front_page_elements/if_con_gallery.dart';
import 'package:baseleal/elements/front_page_elements/if_con_mezmures.dart';
import 'package:baseleal/models/if_con_verse.dart';
import 'package:baseleal/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  final void Function(int) navigateTo;
  const HomePage({
    required this.navigateTo,
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          toolbarHeight: 115,
          shadowColor: Theme.of(context).colorScheme.secondaryFixedDim,
          elevation: 10,
          pinned: true,
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 45),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Welcome!',
                      style: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .onSecondary
                            .withOpacity(0.5),
                        fontFamily: 'Rosarivo',
                        fontSize: 15,
                      ),
                    ),
                    IconButton(
                      onPressed:
                          Provider.of<ThemeProvider>(context, listen: false)
                              .toggleTheme,
                      icon: Provider.of<ThemeProvider>(context, listen: false)
                              .isLightmode
                          ? const Icon(Icons.dark_mode)
                          : const Icon(Icons.light_mode),
                      style: ButtonStyle(
                        padding:
                            const WidgetStatePropertyAll(EdgeInsets.all(12)),
                        iconColor: WidgetStatePropertyAll(
                            Theme.of(context).colorScheme.tertiary,),
                        backgroundColor: WidgetStatePropertyAll(
                            Theme.of(context).colorScheme.onTertiary,),
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'BASELEAL',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Text(
                      'CHOIR',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        AboutUs(
          navigateTo: widget.navigateTo,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 17),
                  IfConGallery(navigateTo: widget.navigateTo),
                  const SizedBox(height: 17),
                  const IfConVerse(),
                  const SizedBox(height: 17),
                  IfConMezmures(navigateTo: widget.navigateTo),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
