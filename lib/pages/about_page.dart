import 'package:baseleal/api_calls/fetching_members.dart';
import 'package:baseleal/elements/connection_checker.dart';
import 'package:baseleal/elements/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<String> devs = [
  "Habib Elias",
  "Robel Esayas",
  "Nathan Sisay",
  "Niftalem T.Selassie",
];

String formation = '''
መነሻው በቤርያ ቤተክርስቲያን መሰረታዊ መንፈሳዊ ትምህርት ሲከታተሉ በነበሩ ግለሰቦች ተሞክሮ ነው። ህብረቱ ከ2010 ዓ.ም ጀምሮ ከተመሰረተበት ጊዜ አንስቶ ከኢትዮጵያ አቆጣጠር ጋር በተጣጣመ መልኩ ለተለያዩ የትምህርት ዘርፎች ማለትም ሰንበት ትምህርት ቤት፣ የደህንነት ትምህርት፣ የደቀመዝሙርነት እና የአገልግሎት ትምህርት ላይ ትልቅ ትኩረት ሰጥቷል። እነዚህ ምሰሶዎች ዓላማውን እና አቅጣጫውን በመቅረጽ ለመመስረት መሰረት ሆነው አገልግለዋል። ይህ ህብረት ባደረገው ጉዞ ሁሉ በርካታ ግለሰቦች ወንድም እና እህቶች ንቁ ተሳትፎ በማድረግ ለስፋቱና ለእድገቱ የበኩላቸውን አስተዋፅዖ ያደረጉ ውድ አባላት መሆናቸውን ልብ ሊባል ይገባል። የዚህን ጉዞ ታሪካዊ ፋይዳ ለመጠበቅ የነዚ ቁርጠኛ ግለሰቦች ስም ከዚህ በታች በጥሞና ተመዝግቧል። ይህንን አንቀጽ በማስፋት፣ በዚህ ህብረት ምስረታ እና እድገት ውስጥ ወሳኝ ሚና ስለነበራቸው አመጣጥ፣ እሴቶች እና ሰዎች የበለጠ ሰፊ ግንዛቤ ማግኘት እንችላለን።
''';
String description = '''
ዘጸአት 31፡1-6 እና ከምዕራፍ 36 እስከ 39፣ ባስልኤል፣ ባስልኤል፣ ወይም ባስልኤል (ዕብራይስጥ፡ בְּצַלְאֵל፣ ባሳልኤል)፣ የማደሪያው ድንኳን ዋና የእጅ ጥበብ ባለሙያ እና የቃል ኪዳኑን ታቦት የመሥራት ኃላፊነት ነበረው በኦሆልያብ። በምዕራፍ 31 ላይ ያለው ክፍል የሙሴ ዋና የእጅ ጥበብ ባለሙያ ሆኖ መመረጡን የሚገልጸው አምላክ የማደሪያው ድንኳን እንዲሠራ እንዴት እንደሚፈልግ በሙሴ ራእይ አውድ ውስጥ ሲሆን ከምዕራፍ 36 እስከ 39 ባስልኤል፣ ኤልያብና እያንዳንዱ ተሰጥኦ ያለው የእጅ ጥበብ ባለሙያና ፈቃደኛ ሠራተኛ ያካሄዱትን የግንባታ ሂደት ይተርካል። 
በመጽሐፍ ቅዱስ ውስጥ በሌላ ቦታ ስሙ የሚገኘው በመጽሐፈ ዜና መዋዕል የዘር ሐረግ ዝርዝር ውስጥ ብቻ ነው፣ 
“ባስልኤል” የሚለው  ስም “በእግዚአብሔር  ጥላ  [ጥበቃ] ውስጥ” ማለት ነው። ባስልኤል  በትውልድ  ሐረግ  ዝርዝር  ውስጥ  የኡሪ ልጅ  ነው (ዘጸአት 31፡1)፣ ከይሁዳ  ነገድ  የሆነ የሆር ልጅ (1ኛ ዜና መዋዕል 2፡18፣ 19፣ 20፣ 50)። የከበሩ  ማዕድናት  እና  ድንጋዮችን  በመቅረጽ  እና  እንጨት  በመቅረጽ  ከፍተኛ  ችሎታ  እና  ድንቅ  ችሎታ  በማሳየቱ  በእደ  ጥበብ  ከፍተኛ  ተሰጥኦ እንደነበረው  ተነግሯል። ጥበቡን  ያስተማረው  ብዙ  ተለማማጆችም  ነበሩት (ዘጸአት 35፡30-35)። በዘጸአት  ላይ  ባለው  ትረካ መሠረት  የመገናኛውን  ድንኳን  እና  የተቀደሱትን  እቃዎች  እንዲሠራ  በእግዚአብሔር  ተጠርቷል  እና  ተሰጥቷል, እንዲሁም የካህናትን  ልብሶች  እና  ለአገልግሎት  የሚያስፈልገውን  ዘይትና  እጣን  አዘጋጅቷል. እርሱ  ደግሞ  የቅዱሳን  ዘይት፣  ዕጣን፣  የክህነት ልብሶች  ኃላፊ  ነበር። 
''';

List<String> members = [
  "Habib Elias",
  "Rachel Tamene",
  "Mellat Debebe",
  "Eyob Yohannes - Leader",
  "Kebron Ermias",
  "Abel Abeje",
  "Niftalem T.selassie",
  "Enjo Yohannes",
  "Zerihun Abeje",
  "Tihitna Tadege",
  "Menderin Samuel",
  "Nathan Sisay",
  "Adonit Milkias",
  "Robel Bekele",
  "Robel Esayas",
  "Lydia Wondimu",
  "Ephrathah Hailu",
  "Akinahom Ashenafi",
  "Tsebaot Ashenafi",
  "Weke Weshera",
  "Betselot Teshome",
  "Selam Tadege",
  "Selam Tamene",
  "Wudasse Getachew",
  "Tsega Getayawkshal",
  "Genet Worku",
  "Seble Kasoye",
  "Hiwot Ermias - Leader",
  "Salem Ketema",
  "Mastewal Teshemo",
  "Atote Getachew",
  "Blen Negatu",
  "Nebiyu Cheru",
  "Kidest Debebe",
  "Meron Alemu",
  "Tesfa Shegute",
  "Abimelech Debebe",
  "Abenezer Mohammed",
  "Kenna Kebede",
  "Mercy Meskerem",
  "Nardos Milion",
  "Wasehun Cheru",
  "Erteban Debebe",
  "Mila Aberu",
  "Eyasu Thomas",
  "Tekle Getayawkal",
  "Zerubabel Kassahun",
];

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  Future<List<dynamic>>? members;
  @override
  Widget build(BuildContext context) {
    NetworkStatus networkStatus = Provider.of<NetworkStatus>(context);
    networkStatus == NetworkStatus.online
        ? members = getMembers()
        : members = fetchingMembersFromBox();
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          titleSpacing: 0,
          shadowColor: Theme.of(context).colorScheme.secondaryFixedDim,
          pinned: true,
          expandedHeight: MediaQuery.of(context).size.height * 0.4,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: const EdgeInsets.only(left: 16, bottom: 5),
            collapseMode: CollapseMode.parallax,
            title: Text(
              'Baseleal',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
                fontFamily: 'poppins',
                fontSize: 20,
              ),
            ),
            background: Image.asset(
              "lib/images/Rectangle 19.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NumMembers(
                members: members,
              ),
              const Description(),
              Members(members: members),
              const Devs(),
            ],
          ),
        )
      ],
    );
  }
}

class Devs extends StatelessWidget {
  const Devs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 17,
          ),
          Text(
            "Devs",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontFamily: 'poppins',
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          ...devs.map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                e,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Theme.of(context)
                      .colorScheme
                      .onSecondary
                      .withOpacity(0.7),
                  fontFamily: 'poppins',
                  fontSize: 13,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 17,
          ),
        ],
      ),
    );
  }
}

class Members extends StatelessWidget {
  final Future<List<dynamic>>? members;
  const Members({
    required this.members,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 17,
          ),
          Text(
            textAlign: TextAlign.start,
            'Members',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
              fontFamily: 'poppins',
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          FutureBuilder(
            future: members,
            builder: (context, futureMembers) {
              if (futureMembers.hasData && futureMembers.data!.isNotEmpty) {
                futureMembers.data!.sort();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: futureMembers.data!
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            e,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondary
                                  .withOpacity(0.7),
                              fontFamily: 'poppins',
                              fontSize: 15,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                );
              } else if (futureMembers.connectionState ==
                  ConnectionState.waiting) {
                return Column(
                  children: List.generate(
                    5,
                    (index) => const Column(
                      children: [
                        Row(
                          children: [
                            Skelton(width: 70, height: 15, borderRadius: 10),
                            SizedBox(
                              width: 20,
                            ),
                            Skelton(width: 50, height: 15, borderRadius: 10),
                          ],
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                );
              } else if (futureMembers.hasError) {
                return Column(
                  children: List.generate(
                    5,
                    (index) => const Skelton(),
                  ),
                );
              } else {
                return Column(
                  children: List.generate(
                    5,
                    (index) => const Skelton(),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textAlign: TextAlign.start,
            'Description',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
              fontFamily: 'poppins',
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 11,
          ),
          Text(
            description,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.8),
              fontFamily: 'Lessan',
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 11),
          Text(
            textAlign: TextAlign.start,
            'How It Was Formed?',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
              fontFamily: 'Poppins',
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 11,
          ),
          Text(
            formation,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.8),
              fontFamily: 'Lessan',
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

class NumMembers extends StatefulWidget {
  final Future<List<dynamic>>? members;
  const NumMembers({
    required this.members,
    super.key,
  });

  @override
  State<NumMembers> createState() => _NumMembersState();
}

class _NumMembersState extends State<NumMembers> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        top: 11.0,
        bottom: 16.0,
      ),
      child: Row(
        children: [
          Icon(
            Icons.group,
            color: Theme.of(context).colorScheme.secondary,
            size: 28,
          ),
          const SizedBox(
            width: 10,
          ),
          FutureBuilder(
              future: widget.members,
              builder: (context, fututureMembers) {
                if (fututureMembers.hasData &&
                    fututureMembers.data!.isNotEmpty) {
                  return Text(
                    fututureMembers.data!.length.toString(),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontFamily: 'poppins',
                      fontSize: 16,
                    ),
                  );
                } else if (fututureMembers.hasError) {
                  return const Skelton(width: 18, height: 18, borderRadius: 4);
                } else if (fututureMembers.connectionState ==
                    ConnectionState.waiting) {
                  return const Skelton(width: 18, height: 18, borderRadius: 4);
                } else {
                  return const Skelton(width: 18, height: 18, borderRadius: 4);
                }
              }),
          const SizedBox(
            width: 5,
          ),
          Text(
            'MEMBERS',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
              fontFamily: 'poppins',
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
