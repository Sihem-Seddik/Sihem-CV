import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:contactus/contactus.dart';
import 'package:provider/provider.dart'; // Import provider package
import 'Theme.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  // Function to launch email app
  void _launchEmail(String email) async {
    if (await canLaunch('mailto:$email')) {
      await launch('mailto:$email');
    } else {
      throw 'Could not launch email';
    }
  }

  // Function to launch phone app
  void _launchPhone(String phoneNumber) async {
    if (await canLaunch('tel:$phoneNumber')) {
      await launch('tel:$phoneNumber');
    } else {
      throw 'Could not launch phone';
    }
  }

  // Function to launch LinkedIn profile
  void _launchLinkedIn(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch LinkedIn';
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider =
        Provider.of<ThemeProvider>(context); // Access theme provider

    return Scaffold(
      backgroundColor: themeProvider.themeMode == ThemeMode.light
          ? Colors.grey[200] // Use ! to assert non-nullability
          : Colors.grey[800], // Use ! to assert non-nullability
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            ContactUs(
              textColor: themeProvider.themeMode == ThemeMode.light
                  ? Colors.teal.shade900 // Use ! to assert non-nullability
                  : Colors
                      .white, // No need for assertion here as Colors.white is non-null
              logo: AssetImage('assets/images/profile.jpg'),
              email: 'sihem.seddik.m@gmail.com',
              companyName: 'Sihem Seddik'.tr(),
              companyColor: Colors.teal.shade100,
              dividerThickness: 2,
              phoneNumber: '+21626072787',
              githubUserName: 'Sihem-Seddik',
              linkedinURL: 'www.linkedin.com/in/sihem-seddik-a77044256',
              tagLine: 'Developer'.tr(),
              taglineColor: Colors.teal.shade100,
              facebookHandle: 'facebook.com/profile.php?id=100068816238374',
              cardColor: themeProvider.themeMode == ThemeMode.light
                  ? Colors.white // Use ! to assert non-nullability
                  : Color.fromARGB(
                      255, 79, 77, 77), // Use ! to assert non-nullability
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
