import 'package:baseleal/models/mezmures_model.dart';
import 'package:baseleal/pages/mezmure_page.dart';
import 'package:flutter/material.dart';

class MezmureTile extends StatelessWidget {
  final Mezmure _mezmure;

  const MezmureTile({
    super.key,
    required mezmure,
  }) : _mezmure = mezmure;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MezmurePage(mezmure: _mezmure),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 26.0,
          left: 32,
          right: 32,
        ),
        child: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(191, 191, 191, 0.6),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _mezmure.name,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    _mezmure.mezmureType,
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              const Icon(
                Icons.arrow_circle_right_rounded,
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
