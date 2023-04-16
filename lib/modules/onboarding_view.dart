import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spod_app/modules/root/root_view.dart';
import 'package:spod_app/theme.dart';

class OnboardingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showWelcomeDialog(context));
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: backgroundColor,
            statusBarIconBrightness: Brightness.dark),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/onboarding_illustration.png",
                height: 300,
              ),
              SizedBox(height: 32,),
              Text(
                "Make It Eazy",
                style: titleTextStyle.copyWith(fontSize: 24,color: darkBlue300),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Discover and Book Sports Venue from Anywhere at Anytime. Let's get healthy and have fun!",
                style: descTextStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(100, 50),
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(borderRadiusSize))
          ),
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setBool("skipOnBoarding", true);
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
              return RootView(
                currentScreen: 0,
              );
            }));
          },
          child: Text(
            "Explore Now",
            style: buttonTextStyle,
          ),
        ),
      ),
    );
  }

  showWelcomeDialog(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
            title: const Text("Thank you for downloading Spod."),
            content: const Text(
                'Keep in mind this is just a demo App, so the content in this app uses Dummy (Fake) Data and some features are still unimplemented.'),
          );
        });
  }
}
