import 'package:baseleal/elements/connection_checker.dart';
import 'package:baseleal/elements/skeleton.dart';
import 'package:baseleal/api_calls/fetching_mezmures.dart';
import 'package:baseleal/models/mezmure_tile.dart';
import 'package:baseleal/models/mezmures_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IfConMezmures extends StatefulWidget {
  final void Function(int) navigateTo;
  const IfConMezmures({required this.navigateTo, super.key});

  @override
  State<IfConMezmures> createState() => _IfConMezmuresState();
}

class _IfConMezmuresState extends State<IfConMezmures> {
  @override
  Widget build(BuildContext context) {
    NetworkStatus networkStatus = Provider.of<NetworkStatus>(context);

    Future<List<Mezmure>>? mezmures = networkStatus == NetworkStatus.online
        ? getMezmures()
        : fetchingMezmureFromBox();
    return FutureBuilder(
      future: mezmures,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          int listLength = snapshot.data!.length - 1;
          List<Mezmure> recentAdd = List.generate(
            4,
            (int index) => snapshot.data![listLength - index],
          );
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Our Mezmures',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontFamily: 'poppins',
                        fontSize: 17,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => widget.navigateTo(2),
                      child: Text(
                        'See All',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              ...recentAdd.map(
                (mezmure) => MezmureTile(mezmure: mezmure),
              )
            ],
          );
        } else if (snapshot.hasError) {
          return const Center(child: Text('connection error'));
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Column(
            children: [
              Skelton(width: 343, height: 24),
              SizedBox(height: 16),
              Skelton(width: 310, height: 69),
              SizedBox(height: 26),
              Skelton(width: 310, height: 69),
              SizedBox(height: 26),
              Skelton(width: 310, height: 69),
              SizedBox(height: 26),
              Skelton(width: 310, height: 69),
            ],
          );
        } else {
          return const SizedBox(
            width: 300,
            height: 600,
            child: Center(
              child: Icon(
                Icons.wifi_off_rounded,
                size: 100,
                color: Colors.grey,
              ),
            ),
          );
        }
      },
    );
  }
}
