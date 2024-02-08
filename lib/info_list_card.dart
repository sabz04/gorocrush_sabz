import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'info_object.dart';

class InfoListCard extends StatelessWidget {
  final Info info;
  const InfoListCard({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 300,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height - 200,
          ),
          decoration: BoxDecoration(
              color: const Color(0xfff288e8),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: const Color(0xfff2c7ee), width: 3)),
          child: Stack(
            children: [
              Positioned(
                  right: 10,
                  top: 5,
                  child: Opacity(
                      opacity: 0.5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          info.asset,
                          height: 50,
                        ),
                      ))),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        info.caption,
                        style: const TextStyle(fontSize: 24, fontFamily: 'Ubuntu', fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
