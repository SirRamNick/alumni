import 'package:flutter/material.dart';

class ProfileContent extends StatelessWidget {
  final Widget contentprofile;
  const ProfileContent({super.key, required this.contentprofile});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 7, left: 500, right: 500, bottom: 7),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: SizedBox(
          height: 20,
          width: 50,
          child: contentprofile,
        ),
      ),
    );
  }
}
