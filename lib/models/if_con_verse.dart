import 'package:baseleal/elements/connection_checker.dart';
import 'package:baseleal/elements/skeleton.dart';
import 'package:baseleal/api_calls/fetching_todays_verse.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IfConVerse extends StatefulWidget {
  const IfConVerse({super.key});

  @override
  State<IfConVerse> createState() => _IfConVerseState();
}

class _IfConVerseState extends State<IfConVerse> {
  @override
  Widget build(BuildContext context) {
    NetworkStatus networkStatus = Provider.of<NetworkStatus>(context);
    Future<String>? verse = networkStatus == NetworkStatus.online
        ? getTodaysverse()
        : fetchVerseFromHive();

    return FutureBuilder(
        future: verse,
        builder: (context, futureVerse) {
          if (futureVerse.hasData && futureVerse.data!.isNotEmpty) {
            return Column(
              children: [
                Text(
                  "Daily verse",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontFamily: 'poppins',
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                SizedBox(
                  width: 300,
                  child: Text(
                    futureVerse.data!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Sadiss',
                      fontSize: 16,
                      color: Theme.of(context)
                          .colorScheme
                          .onSecondary
                          .withOpacity(1),
                    ),
                  ),
                ),
              ],
            );
          } else if (futureVerse.hasError) {
            return const Center(
              child: Icon(
                Icons.signal_wifi_statusbar_connected_no_internet_4_sharp,
                color: Colors.grey,
                size: 40,
              ),
            );
          } else if (futureVerse.connectionState == ConnectionState.waiting) {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Skelton(width: 115, height: 16),
                SizedBox(height: 12),
                Skelton(width: 184, height: 16),
                SizedBox(height: 4),
                Skelton(width: 224, height: 16),
                SizedBox(height: 4),
                Skelton(width: 194, height: 16),
              ],
            );
          } else {
            return const SizedBox(
              width: 0,
            );
          }
        });
  }
}
