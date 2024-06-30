import 'package:analytical_apex_weather_app/widgets/appBar_widget.dart';
import 'package:analytical_apex_weather_app/widgets/background_widget.dart';
import 'package:analytical_apex_weather_app/widgets/button_widget.dart';
import 'package:analytical_apex_weather_app/widgets/logo_widget.dart';
import 'package:flutter/material.dart';

class ScreenC extends StatelessWidget {
  const ScreenC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: 'Contact Us',
        appBar: AppBar(),
        actions: const [],
      ),
      body: const Stack(
        children: [
          BackgroundWidget(),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 0 * kToolbarHeight + 0, 40, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LogoWidget(),
                SizedBox(height: 0),
                UrlButton(
                  url: 'https://weathery-website-six.vercel.app/contact_us.html',
                  text: 'Contact Us',
                ),
                SizedBox(height: 0),
                UrlButton(
                  url: 'https://weathery-website-six.vercel.app/index.html',
                  text: 'Website',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
