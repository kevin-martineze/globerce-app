import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

/// Abre [url] en el navegador del teléfono. Si no se puede, avisa con un
/// `SnackBar` con [failureMessage].
Future<void> openExternalLink(
  BuildContext context,
  String url, {
  required String failureMessage,
}) async {
  final messenger = ScaffoldMessenger.maybeOf(context);
  final opened = await launchUrl(
    Uri.parse(url),
    mode: LaunchMode.externalApplication,
  );

  if (!opened) {
    messenger?.showSnackBar(SnackBar(content: Text(failureMessage)));
  }
}
