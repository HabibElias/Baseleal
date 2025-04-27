import 'package:baseleal/elements/connection_checker.dart';
import 'package:baseleal/elements/skeleton.dart';
import 'package:baseleal/api_calls/fetching_mezmures.dart';
import 'package:baseleal/models/mezmure_tile.dart';
import 'package:baseleal/models/mezmures_model.dart';
import 'package:baseleal/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LyricsPage extends StatefulWidget {
  const LyricsPage({super.key});

  @override
  State<LyricsPage> createState() => _LyricsPageState();
}

class _LyricsPageState extends State<LyricsPage> {
  Future<void> refresh(Future<List<Mezmure>>? mezmures) async {
    await Future.delayed(const Duration(seconds: 0));
    final getmezmures = getMezmures();
    setState(() {
      mezmures = getmezmures;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<List<Mezmure>>? mezmures;
    NetworkStatus networkStatus = Provider.of<NetworkStatus>(context);

    networkStatus == NetworkStatus.online
        ? mezmures = getMezmures()
        : mezmures = fetchingMezmureFromBox();

    return RefreshIndicator(
      color: Theme.of(context).colorScheme.onSecondary,
      onRefresh: () => refresh(mezmures),
      child: CustomScrollView(
        primary: true,
        slivers: [
          SliverAppBar(
            leadingWidth: 72,
            shadowColor: Theme.of(context).colorScheme.secondaryFixedDim,
            toolbarHeight: 80,
            pinned: true,
            elevation: 10,
            centerTitle: true,
            leading: IconButton(
              onPressed: Provider.of<ThemeProvider>(context, listen: false)
                  .toggleTheme,
              icon:
                  Provider.of<ThemeProvider>(context, listen: false).isLightmode
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
              'Our Mezmures',
              style: TextStyle(
                fontFamily: 'poppins',
                fontSize: 18,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: FutureBuilder(
              future: mezmures,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return SizedBox(
                      width: double.maxFinite,
                      height: MediaQuery.of(context).size.height * 0.8,
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
                            size: 150,
                            color: Colors.grey,
                          ),
                          IconButton(
                              onPressed: () => refresh(mezmures),
                              icon: const Icon(Icons.refresh_sharp))
                        ],
                      ),
                    );
                  }
                  return Column(
                    children: [
                      if (snapshot.data!.isNotEmpty)
                        ...snapshot.data!.map(
                          (mezmure) => MezmureTile(mezmure: mezmure),
                        )
                    ],
                  );
                } else if (snapshot.hasError) {
                  return const Center(child: Text('connection error'));
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Column(
                    children: List.generate(
                      8,
                      (index) => const Column(
                        children: [
                          Skelton(width: 310, height: 69),
                          SizedBox(height: 26),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const Center(child: Text('something went wrong'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
