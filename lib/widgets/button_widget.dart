import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlButton extends StatefulWidget {
  final String text;
  final String url;

  const UrlButton({super.key, required this.text, required this.url});

  @override
  UrlButtonState createState() => UrlButtonState();
}

class UrlButtonState extends State<UrlButton> {
  void _launchURL() async {
    final uri = Uri.parse(widget.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch ${widget.url}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _launchURL,
      child: Text(widget.text),
    );
  }
}
