import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'lera_button.dart';

class MainCard extends StatefulWidget {
  final Function? onTapNegative;
  final Function? onTapPositive;
  final bool isNegativeVisible;
  const MainCard({super.key, this.onTapNegative, this.onTapPositive, this.isNegativeVisible = true});

  @override
  State<MainCard> createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {
  String _mCurrentStatus = 'assets/gif/cute_cat_0.gif';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              _mCurrentStatus,
              height: 150,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Ты выйдешь со мной погулять??? <3',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontFamily: 'Ubuntu', fontWeight: FontWeight.w500, color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CuteButton(
                caption: "Да!!!",
                onMouseEnter: () {
                  changeImageStatus('assets/gif/cute_cat_1.gif');
                },
                onMouseLeave: () {
                  changeImageStatus('assets/gif/cute_cat_0.gif');
                },
                onTap: () {
                  if (widget.onTapPositive != null) widget.onTapPositive!();
                },
              ),
              if (widget.isNegativeVisible)
                const SizedBox(
                  width: 20,
                ),
              if (widget.isNegativeVisible)
                CuteButton(
                  caption: "Нет...",
                  onMouseEnter: () {
                    changeImageStatus('assets/gif/cute_cat_angry_2.gif');
                  },
                  onMouseLeave: () {
                    changeImageStatus('assets/gif/cute_cat_0.gif');
                  },
                  onTap: () {
                    if (widget.onTapNegative != null) widget.onTapNegative!();
                  },
                ),
            ],
          )
        ],
      ),
    );
  }

  void changeImageStatus(String assetName) {
    _mCurrentStatus = assetName;
    setState(() {});
  }
}
