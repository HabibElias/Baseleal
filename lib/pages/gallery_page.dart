import 'package:baseleal/api_calls/fetching_gallery.dart';
import 'package:baseleal/elements/connection_checker.dart';
import 'package:baseleal/elements/skeleton.dart';
import 'package:baseleal/models/gallery_model.dart';
import 'package:baseleal/models/gallery_tile.dart';
import 'package:baseleal/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  Future<List<Gallery>>? gallery;

  Future<void> refresh(Future<List<Gallery>>? gallery) async {
    await Future.delayed(const Duration(seconds: 1));
    final getGalleries = getGallery();

    setState(() {
      gallery = getGalleries;
    });
  }

  @override
  Widget build(BuildContext context) {
    NetworkStatus networkStatus = Provider.of<NetworkStatus>(context);

    networkStatus == NetworkStatus.online
        ? gallery = getGallery()
        : gallery = fetchGalleryFromHive();
    return RefreshIndicator(
      onRefresh: () => refresh(gallery),
      color: Theme.of(context).colorScheme.onSecondary,
      child: CustomScrollView(slivers: [
        SliverAppBar(
          shadowColor: Theme.of(context).colorScheme.secondaryFixedDim,
          leadingWidth: 72,
          toolbarHeight: 80,
          pinned: true,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed:
                Provider.of<ThemeProvider>(context, listen: false).toggleTheme,
            icon: Provider.of<ThemeProvider>(context, listen: false).isLightmode
                ? const Icon(Icons.dark_mode)
                : const Icon(Icons.light_mode),
            style: ButtonStyle(
              padding: const WidgetStatePropertyAll(EdgeInsets.all(12)),
              iconColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.tertiary),
              backgroundColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.onTertiary),
            ),
          ),
          title: Text(
            'Gallery',
            style: TextStyle(
              fontFamily: 'poppins',
              fontSize: 18,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Text(
                  'Albums',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontFamily: 'poppins',
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Divider(
                  height: 4,
                  thickness: 3,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: FutureBuilder(
              future: gallery,
              builder: (context, futureGallery) {
                if (futureGallery.hasData && futureGallery.data!.isNotEmpty) {
                  return Column(
                      children: futureGallery.data!.map(
                    (gallery) {
                      return GalleryTile(gallery: gallery);
                    },
                  ).toList());
                } else if (futureGallery.hasError) {
                  return SizedBox(
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Check Your Internet',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontFamily: 'poppins',
                            fontSize: 16,
                          ),
                        ),
                        const Icon(
                          Icons.signal_wifi_connected_no_internet_4_sharp,
                          size: 100,
                          color: Color.fromARGB(255, 155, 74, 68),
                        ),
                        IconButton(
                            onPressed: () => refresh(gallery),
                            icon: const Icon(Icons.refresh_sharp))
                      ],
                    ),
                  );
                } else if (futureGallery.connectionState ==
                    ConnectionState.waiting) {
                  return Column(
                    children: [
                      ...List.generate(
                        4,
                        (index) {
                          return const Column(
                            children: [
                              SizedBox(height: 30),
                              Skelton(
                                width: 343,
                                height: 110,
                                borderRadius: 10,
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  );
                } else {
                  return SizedBox(
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'No Internet',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontFamily: 'poppins',
                            fontSize: 16,
                          ),
                        ),
                        const Icon(
                          Icons.wifi_off_rounded,
                          size: 100,
                          color: Colors.grey,
                        ),
                        IconButton(
                            onPressed: () => refresh(gallery),
                            icon: const Icon(Icons.refresh_sharp))
                      ],
                    ),
                  );
                }
              }),
        ),
      ]),
    );
  }
}
