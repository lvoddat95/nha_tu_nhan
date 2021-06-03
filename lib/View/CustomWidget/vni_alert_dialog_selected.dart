import 'package:flutter/material.dart';

class VniAlertDialogSlected extends StatelessWidget {
  const VniAlertDialogSlected({
    Key key,
    @required this.label,
    @required this.placeholder,
    @required this.onPress,
  }) : super(key: key);

  final String label;
  final String placeholder;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 32,
            child: RaisedButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: BorderSide(color: Colors.grey),
              ),
              elevation: 0,
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Center the Widgets.
                mainAxisSize:
                    MainAxisSize.max, // Use all of width in RaisedButton.
                children: [
                  Text(
                    placeholder,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey[700],
                    size: 18,
                  ),
                ],
              ),
              onPressed: onPress,

              /// For enabling the button
            ),
          ),
        ],
      ),
    ));
  }
}
