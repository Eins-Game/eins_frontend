import 'package:flutter/material.dart';

class EinsButton extends StatelessWidget {
  const EinsButton({Key key, this.onPressed, this.width, this.title}) : super(key: key);

  final Function onPressed;
  final double width;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: ElevatedButton(
          onPressed: onPressed,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Container(
                height: 50,
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        fontSize: 20
                    ),
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }
}
