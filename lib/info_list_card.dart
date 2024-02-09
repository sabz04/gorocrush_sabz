import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'info_object.dart';

class InfoListCard extends StatefulWidget {
  final Info info;
  const InfoListCard({super.key, required this.info});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InfoListCardState();
  }
}

class InfoListCardState extends State<InfoListCard>{

  bool _tapped = false;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (d){
        _tapped = true;
        setState(() {

        });
      },
      onTapUp: (details) {
        _tapped = false;
        setState(() {

        });
      },
      onTapCancel: () {
        _tapped = false;
        setState(() {

        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedScale(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            scale: _tapped ? 1.05 : 1.0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOut,
              width:  _tapped ? 330 : 300,
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height - 200,
              ),
              decoration: BoxDecoration(
                  color: const Color(0xfff288e8),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: const Color(0xfff2c7ee), width: _tapped ? 6 : 3)),
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
                              widget.info.asset,
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
                            widget.info.caption,
                            style: const TextStyle(fontSize: 24, fontFamily: 'Ubuntu', fontWeight: FontWeight.w500, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
