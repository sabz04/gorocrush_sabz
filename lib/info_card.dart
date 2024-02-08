import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/info_object.dart';
import 'package:untitled/lera_button.dart';

class InfoCard extends StatelessWidget {
  final Info info;
  final Function onNextPage;
  final Function onPrevPage;
  final int currentIndex;
  final int totalCount;
  const InfoCard({super.key,
    required this.onNextPage,
    required this.onPrevPage,
    required this.info, required this.currentIndex, required this.totalCount});

  @override
  Widget build(BuildContext context) {

    final _scrollController = ScrollController();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
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
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: RawScrollbar(
                controller: _scrollController,
                thumbVisibility: true,
                trackVisibility: true,
                thumbColor: const Color(0xfff2c7ee).withOpacity(0.5),
                trackColor: const Color(0xfff2c7ee).withOpacity(0.2),
                thickness: 3,
                padding: const EdgeInsets.only(right: -5),
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          info.caption,
                          style: const TextStyle(fontSize: 24, fontFamily: 'Ubuntu', fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                right: 10,
                top: 5,
                child: Opacity(
                    opacity: 0.7,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        info.asset,
                        height: 50,
                      ),
                    ))),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(currentIndex < totalCount && currentIndex != 0)
                CuteButton(
                  onTap: () => onPrevPage(),
                  caption: 'Назад',
                  fontSize: 24,
                ),
              if(currentIndex < totalCount && currentIndex != 0)
                const SizedBox(width: 15,),
                CuteButton(
                  onTap: () => onNextPage(),
                  caption: 'Далее',
                  fontSize: 24,
                ),
            ],
          ),
        )
      ],
    );
  }
}
