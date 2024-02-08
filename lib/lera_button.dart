import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CuteButton extends StatefulWidget {
  final String caption;
  final Function? onTap;
  final double fontSize;
  final Function? onMouseEnter;
  final Function? onMouseLeave;
  final Function? onTapCancel;
  final Color negativeColor;

  const CuteButton(
      {super.key,
      this.caption = "",
      this.fontSize = 30,
      this.onMouseEnter,
      this.onMouseLeave,
      this.onTapCancel,
      this.negativeColor = const Color(0xfff2c7ee),
      this.onTap});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CuteButtonState();
  }
}

class CuteButtonState extends State<CuteButton> with TickerProviderStateMixin {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        _scale = 1.2;
        setState(() {});
        if (widget.onMouseEnter != null) widget.onMouseEnter!();
      },
      onExit: (event) {
        _scale = 1.0;
        setState(() {});
        if (widget.onMouseLeave != null) widget.onMouseLeave!();
      },
      child: GestureDetector(
        onTap: () {
          if (widget.onTap != null) widget.onTap!();
        },
        onTapDown: (v) {
          _scale = 1.2;
          setState(() {});
        },
        onTapUp: (v) {
          _scale = 1.0;
          setState(() {});
        },
        onTapCancel: () {
          _scale = 1.0;
          setState(() {});
        },
        child: AnimatedScale(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          scale: _scale,
          child: AnimatedContainer(
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 250),
            decoration: BoxDecoration(
                color: const Color(0xfff288e8),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: widget.negativeColor, width: _scale == 1.0 ? 2 : 7)),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
            child: Text(
              widget.caption,
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: widget.fontSize, fontFamily: 'Ubuntu', fontWeight: FontWeight.w500, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
