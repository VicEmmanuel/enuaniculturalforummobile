import 'package:url_launcher/url_launcher.dart';

launchInURL(Uri testUrl) async {
  if (await canLaunchUrl(testUrl)) {
    await launchUrl(
        testUrl,
        mode: LaunchMode.externalApplication
    );
  } else {
    throw 'Could not launch $testUrl';
  }
}