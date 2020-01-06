import 'package:flutter/material.dart';

class ActivityBoxWidget extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String hobby;
  final Function onHobbyTap;

  ActivityBoxWidget({@required this.color, @required this.icon, @required this.hobby, this.onHobbyTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onHobbyTap(hobby);
      },
      child: Material(
        elevation: 4,
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        child: Container(
          margin: const EdgeInsets.only(top: 4, bottom: 4),
          padding: const EdgeInsets.only(top: 4, bottom: 4),
          height: 120,
          width: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                icon,
                color: Colors.white,
                size: 50,
              ),
              Container(
                width: 90,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              Text(
                hobby,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
