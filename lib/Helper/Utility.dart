import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
int PrimaryColor700 = 0xFF00546F;
int PrimaryColor500 = 0xFF00819D;
int SecondaryColor500 = 0xFFF69B08;
int PrimaryColor900 = 0xFFF004156;
class Utility {
  static Utility utility = null;

  static Utility getInstance() {
    if (utility == null) {
      utility = Utility();
    }
    return utility;
  }

  static Future<int> showAlertDialog(BuildContext context,
      String dialogTitle,
      List<String> data,
      int stateIndex,) async {
    int position = stateIndex;
    await showDialog(
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
                      itemBuilder: (BuildContext context, int index) {
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
                                        data[index],
                                        maxLines: 3,
                                        style: Theme
                                            .of(context)
                                            .textTheme
                                            .bodyText2
                                            .apply(color: Colors.grey[700]),
                                      ),
                                    ),
                                  ),
                                  (index == stateIndex)
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
                                Navigator.pop(context, index);
                                position = index;
                                return data[index];
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
    return position;

  }

  static showDialogOneButton(BuildContext context,
      {@required String title,
        @required String content,
        String okBtnText = "Xác nhận",
        @required Function okBtnFunction}) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(
              title,
              style: CustomStylesText.customTextStyleSub12Grey900(context),
            ),
            content: Text(
              content,
              style: CustomStylesText.customTextStyleBody2Grey700(context),
            ),
            actions: <Widget>[
              FlatButton(
                  child: Text(
                    okBtnText,
                    style: TextStyle(
                        color: Color(0xFF00819D),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  onPressed: (okBtnFunction))
            ],
          );
        });
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

class CustomStylesText {
  static TextStyle customTextStyleH6White(BuildContext context) {
    return Theme.of(context).textTheme.headline6.apply(color: Colors.white);
  }

  static TextStyle customTextStyleH6Grey900(BuildContext context) {
    return Theme.of(context).textTheme.headline6.apply(color: Colors.grey[900]);
  }

  static TextStyle customTextStyleBody2Grey700(BuildContext context) {
    return Theme.of(context).textTheme.bodyText2.apply(color: Colors.grey[700]);
  }

  static TextStyle customTextStyleTilteSub2Grey700(BuildContext context) {
    return Theme.of(context).textTheme.subtitle2.apply(color: Colors.grey[700]);
  }

  static TextStyle customTextStyleCaptionGrey500(BuildContext context) {
    return Theme.of(context).textTheme.caption.apply(color: Colors.grey[500]);
  }

  static TextStyle customTextStyleCaptionGrey900(BuildContext context) {
    return Theme.of(context).textTheme.caption.apply(color: Colors.grey[900]);
  }

  static TextStyle customTextStyleBody2White(BuildContext context) {
    return Theme.of(context).textTheme.bodyText2.apply(color: Colors.white);
  }

  static TextStyle customTextStyleSub12Grey900(BuildContext context) {
    return Theme.of(context).textTheme.subtitle1.apply(color: Colors.grey[900]);
  }


  static TextStyle customTextStyleButtonPrimaryColors500(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .button
        .apply(color: Color(PrimaryColor500));
  }
}

