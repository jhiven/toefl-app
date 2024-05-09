import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String image;
  final String title;

  const CustomListTile({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: InkWell(
        onTap: () {
          print('Container ditekan');
        },
        child: Container(
          height: 92,
          decoration: BoxDecoration(
            color: Color(0xFF14487A),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Image.asset(
                  image,
                  width: 40, // Ubah lebar gambar
                  height: 40, // Ubah tinggi gambar
                ),
              ),
              SizedBox(width: 16.0),
              Text(
                title,
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
