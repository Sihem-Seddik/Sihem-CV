import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';
import 'package:flip_card/flip_card.dart';

import 'Theme.dart'; // Make sure to import your ThemeProvider

class ProjectsPage extends StatelessWidget {
  final List<Widget> fancyCards = <Widget>[
    FancyFlipCard(
      frontImage: Image.asset("assets/images/express.jpg"),
      frontTitle: "Utex Express".tr(),
      backExplanation:
          "Commandes en ligne, suivi des commandes, gestion financière.".tr(),
    ),
    FancyFlipCard(
      frontImage: Image.asset("assets/images/bebeto.jpg"),
      frontTitle: "Bebeto".tr(),
      backExplanation:
          "Application e-commerce de vente en ligne pour une parapharmacie."
              .tr(),
    ),
    FancyFlipCard(
      frontImage: Image.asset("assets/images/coupe.jpg"),
      frontTitle: "Utex Coupe".tr(),
      backExplanation:
          "Application de gestion pour une usine de textile (réception des commandes, préparation des commandes, etc.)."
              .tr(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: themeProvider.themeMode == ThemeMode.light
          ? Colors.grey[100] // Light theme background color
          : Colors.grey[900], // Dark theme background color
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: StackedCardCarousel(
              items: fancyCards,
            ),
          ),
        ],
      ),
    );
  }
}

Widget getTitleText(String title) => Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: TextStyle(
          color: Color.fromARGB(255, 67, 220, 146),
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

class FancyFlipCard extends StatelessWidget {
  const FancyFlipCard({
    Key? key,
    required this.frontImage,
    required this.frontTitle,
    required this.backExplanation,
  }) : super(key: key);

  final Image frontImage;
  final String frontTitle;
  final String backExplanation;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return FlipCard(
      direction: FlipDirection.VERTICAL,
      front: Card(
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              Container(
                width: 200,
                height: 200,
                child: frontImage,
              ),
              SizedBox(height: 20),
              Text(
                frontTitle,
                style: themeProvider.themeMode == ThemeMode.light
                    ? Theme.of(context).textTheme.headline6
                    : Theme.of(context).textTheme.headline6!.copyWith(
                          color: Color.fromARGB(255, 23, 195, 149),
                        ),
              ),
            ],
          ),
        ),
      ),
      back: Card(
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                frontTitle,
                style: themeProvider.themeMode == ThemeMode.light
                    ? Theme.of(context).textTheme.headline6
                    : Theme.of(context).textTheme.headline6!.copyWith(
                          color: Color.fromARGB(255, 23, 195, 149),
                        ),
              ),
              SizedBox(height: 20),
              Text(
                backExplanation,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
