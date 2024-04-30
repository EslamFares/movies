import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/functions/show_snack.dart';
import 'package:movies/core/widgets/small_icon_button.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return SmallIconButton(
        icon: Icons.share,
        onPressed: () {
          FlutterClipboard.copy(text).then((value) => showSnack(context,
              contentType: ContentType.help,
              message: 'copied to clipboard',
              title: "Share"));
        });
  }
}
