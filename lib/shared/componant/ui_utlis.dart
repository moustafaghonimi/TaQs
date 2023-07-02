import 'package:flutter/material.dart';

void showLoading(String massage, BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: AlertDialog(
            backgroundColor: Colors.white,
            actions: [
              Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(massage,style: TextStyle(fontSize: 20),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  ),
                ],
              )

            ],
          ),
        ),
      );
    },
  );
}

void showMasage(BuildContext context, String massage, String posText,
    VoidCallback posAction,
    {String? negText, VoidCallback? negAction}) {
  showDialog(
    context: context,
    builder: (context) {
      List<Widget> actions = [
        TextButton(onPressed: posAction, child: Text(posText)),
      ];
      if (negText != null) {
        actions
            .add(TextButton(onPressed: negAction, child: Text(negText)));
      }
      return AlertDialog(
        title: Text(massage),
        actions: actions,
      );
    },
  );
}

void hideMassage(BuildContext context) {
  Navigator.pop(context);
}
