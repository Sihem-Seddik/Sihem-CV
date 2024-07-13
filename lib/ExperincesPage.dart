import 'package:cv_portfolio/HobbiesPage.dart';
import 'package:cv_portfolio/ProjectsPage.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Theme.dart';

class ExperiencePage extends StatelessWidget {
  final List<Map<String, dynamic>> cardData = [
    {
      'icon': Icons.work_history,
      'title': 'Developer'.tr(),
      'date': '2023-07-21 - Now',
      'description':
          'Application and software development at SUNEVIT company'.tr(),
    },
    {
      'icon': Icons.school,
      'title': 'Final internship'.tr(),
      'date': '2023-02-06 - 2023-05-31',
      'description':
          'Cross-platform app development using Flutter at SUNEVIT Company.'
              .tr(),
    },
    {
      'icon': Icons.school,
      'title': 'Advanced internship'.tr(),
      'date': '2022-01-17 - 2022-02-12'.tr(),
      'description':
          'Web project development using Laravel & Vue js at Technobazar Company.'
              .tr(),
    },
    {
      'icon': Icons.school,
      'title': 'Initiation internship'.tr(),
      'date': '2021-07-01 - 2021-08-01'.tr(),
      'description':
          'Web project development React Js & Node Js at Primatec Engineering Company.'
              .tr(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: themeProvider.themeMode == ThemeMode.light
          ? Colors.grey[100] // Light theme background color
          : Colors.grey[900], // Dark theme background color
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                getTitleText("Professional Summary".tr()),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: ProjectsPage(),
                          ),
                        );
                      },
                    );
                  },
                  child: Text("Projets?".tr()),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 67, 220, 146), // Button color
                    onPrimary: Colors.white, // Text color
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  CustomCardList(cardData: cardData),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getTitleText(String title) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          title,
          style: TextStyle(
            color: Color.fromARGB(255, 67, 220, 146),
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}

class CustomCardList extends StatelessWidget {
  final List<Map<String, dynamic>> cardData;

  CustomCardList({required this.cardData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: cardData.map((data) {
        return CustomCard(
          icon: data['icon'],
          title: data['title'],
          date: data['date'],
          description: data['description'],
        );
      }).toList(),
    );
  }
}

class CustomCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String date;
  final String description;

  CustomCard({
    required this.icon,
    required this.title,
    required this.date,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 12),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Theme.of(context).cardColor, // Use the theme's card color
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Row(
          children: [
            Icon(
              icon,
              size: 25,
              color: Color.fromARGB(255, 138, 221, 161),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).textTheme.bodyText2!.color,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
