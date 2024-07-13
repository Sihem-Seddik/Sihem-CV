import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'MyInformations.dart';
import 'Theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  const SizedBox(height: 32.0),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                    radius: 130.0,
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              "Unravel the mystery of 'Who am I?'".tr(),
              style: const TextStyle(fontSize: 19.0),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 138, 221, 161),
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Menu()),
                );
              },
              child: Text("Shall we discover".tr()),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'toggleThemeFAB',
            onPressed: themeProvider.toggleTheme,
            child: const Icon(Icons.lightbulb_outline),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'languageFAB',
            onPressed: () {
              _showLanguageDialog(context);
            },
            child: const Icon(Icons.language),
          ),
        ],
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Language'.tr()),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('English'.tr()),
                onTap: () {
                  context.setLocale(Locale('en', 'US'));
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text('French'.tr()),
                onTap: () {
                  context.setLocale(Locale('fr', 'FR'));
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text('Arabic'.tr()),
                onTap: () {
                  context.setLocale(Locale('ar', 'AR'));
                  Navigator.of(context).pop();
                },
              ),
              // Add more languages here as needed
            ],
          ),
        );
      },
    );
  }
}
