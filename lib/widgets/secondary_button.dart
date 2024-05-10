import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SecondaryButton extends StatefulWidget {
  final String opsi;
  final String text;

  const SecondaryButton({super.key, required this.opsi, required this.text});

  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  late MediaQueryData queryData = MediaQuery.of(context);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: SizedBox(
        width: queryData.size.width,
        height: queryData.size.width * 1 / 7,
        child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.tertiaryContainer)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: queryData.size.width * 1 / 8,
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          widget.opsi,
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        )),
                  ),
                  SizedBox(
                    width: queryData.size.width * 1 / 1.9,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(widget.text,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
