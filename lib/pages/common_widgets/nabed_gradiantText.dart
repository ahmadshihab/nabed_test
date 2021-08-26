import 'package:flutter/material.dart';

import 'package:nabed_test/config/colors.dart';
import 'package:nabed_test/config/size_config.dart';
import 'package:nabed_test/pages/common_widgets/progressBar.dart';

class NabedGradientButton extends StatelessWidget {
  const NabedGradientButton({
    Key? key,
    this.text,
    this.onPressed,
    this.context,
    this.isLoading = false,
    this.enable = true,
  }) : super(key: key);

  final String? text;
  final Function? onPressed;
  final BuildContext? context;
  final bool isLoading;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight! * 0.08,
      child: RaisedButton(
        onPressed: (isLoading || !enable)
            ? null
            : () {
                FocusScope.of(context).unfocus();
                onPressed!();
              },
        elevation: 0,
        hoverElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: const EdgeInsets.all(0.0),
        child: Ink(
          decoration: (isLoading || !enable)
              ? null
              : const BoxDecoration(
                  gradient: BUTTON_GRADIENT,
                  borderRadius: BorderRadius.all(Radius.circular(80.0)),
                ),
          child: Container(
            constraints: const BoxConstraints(
                minWidth: double.infinity,
                minHeight: 55), // min sizes for Material buttons
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                ProgressBar(visibility: isLoading, padding: 8.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
