import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Theme.dart'; // Import provider package

class EducationPage extends StatelessWidget {
  final List<Map<String, dynamic>> cardData = [
    {
      'title': 'Master\'s degree'.tr(),
      'date': '2023-10-01  - Now'.tr(),
      'description': 'Development of Computer Systems and Networks'.tr(),
    },
    {
      'title': 'Bachelor\'s degree'.tr(),
      'date': '2023',
      'description': 'Bachelor\'s degree in Computer Technologies'.tr(),
    },
    {
      'title': 'Baccalaureate'.tr(),
      'date': '2020'.tr(),
      'description':
          'Baccalaureate in Experimental Sciences, main session'.tr(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider =
        Provider.of<ThemeProvider>(context); // Access theme provider

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
            getTitleText("Educational summary".tr()),
            Expanded(
              child: CustomCardList(cardData: cardData),
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
            color: Color.fromARGB(
                255, 67, 220, 146), // Adjust for dark theme text color
            fontSize: 18,
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
    return ListView.builder(
      itemCount: cardData.length,
      itemBuilder: (context, index) {
        return CustomCard(
          title: cardData[index]['title'],
          date: cardData[index]['date'],
          description: cardData[index]['description'],
        );
      },
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final String date;
  final String description;

  CustomCard({
    required this.title,
    required this.date,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider =
        Provider.of<ThemeProvider>(context); // Access theme provider

    return Card(
      margin: EdgeInsets.symmetric(vertical: 15),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: themeProvider.themeMode == ThemeMode.light
          ? Colors.grey[300] // Light theme card color
          : Colors.grey[800], // Dark theme card color
      child: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.themeMode == ThemeMode.light
                      ? Colors.black87 // Adjust for light theme text color
                      : Colors.white, // Adjust for dark theme text color
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              date,
              style: TextStyle(
                fontSize: 12,
                color: themeProvider.themeMode == ThemeMode.light
                    ? Colors.grey[600] // Adjust for light theme text color
                    : Colors.grey[400], // Adjust for dark theme text color
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: themeProvider.themeMode == ThemeMode.light
                    ? Colors.black87 // Adjust for light theme text color
                    : Colors.white, // Adjust for dark theme text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
