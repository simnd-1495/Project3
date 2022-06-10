import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final String? title;
  final IconData? iconLeft;
  final IconData? iconRight;
  const TopBar({Key? key, this.title, this.iconLeft, this.iconRight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(iconLeft),
              onPressed: () {},
            ),
            title != null
                ? Text(
                    title!,
                    textAlign: TextAlign.center,
                  )
                : const Spacer(),
            IconButton(
              icon: Icon(iconRight),
              onPressed: () {
                print('simmmmmm');
              },
            ),
          ],
        ));
  }
}
