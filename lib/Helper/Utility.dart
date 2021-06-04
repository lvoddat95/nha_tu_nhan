import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Utility {
  static Utility utility = null;

  static Utility getInstance() {
    if (utility == null) {
      utility = Utility();
    }
    return utility;
  }

  static Future<int> showAlertDialog(
    BuildContext context,
    String dialogTitle,
    List<String> data,
    int stateIndex,
  ) async {
    int position = stateIndex;
    position = await showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0.0),
          scrollable: false,
          title: Text(dialogTitle),
          content: Container(
            width: double.maxFinite,
            height: (16 + 50 * data.length).toDouble(),
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int position) {
                        return Column(
                          children: [
                            Divider(
                              color: Colors.grey[300],
                              height: 1,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                            ),
                            FlatButton(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: AutoSizeText(
                                        data[position],
                                        maxLines: 3,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2
                                            .apply(color: Colors.grey[700]),
                                      ),
                                    ),
                                  ),
                                  (position == stateIndex)
                                      ? Icon(
                                          Icons.radio_button_checked_rounded,
                                          color: ConvertHexColor('00819D'),
                                          size: 20,
                                        )
                                      : Icon(
                                          Icons.radio_button_unchecked_rounded,
                                          color: Colors.black,
                                          size: 20,
                                        ),
                                ],
                              ),
                              onPressed: () {
                                print(context);
                                print('utility position $position');
                                Navigator.pop(context, position);
                                return data[position];
                              },
                            )
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
    return position ?? 0;
  }
}

class ConvertHexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  ConvertHexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
