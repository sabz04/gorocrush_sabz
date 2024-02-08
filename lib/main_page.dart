import 'dart:async';

import 'package:auto_scroll/auto_scroll.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'package:untitled/info_card.dart';
import 'package:untitled/info_list_card.dart';
import 'package:untitled/lera_button.dart';
import 'package:untitled/main_card.dart';

import 'info_object.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  bool _mShowNegative = true;

  int _mView = 0;

  int _mSelectedInfoData = 0;

  List<String> _mCatsData = [
    'assets/gifs_array/cat_0.gif',
    'assets/gifs_array/cat_1.gif',
    'assets/gifs_array/cat_2.gif',
    'assets/gifs_array/cat_3.gif',
    'assets/gifs_array/cat_4.gif',
    'assets/gifs_array/cat_5.gif',
    'assets/gifs_array/cat_6.gif',
    'assets/gifs_array/cat_7.gif',
    'assets/gifs_array/cat_8.gif',
  ];

  List<Info> _mInfoData = [];
  List<Info> _mInfoDataAutoList = [];

  late final _mController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500))..forward();
  late final _mDoubleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _mController, curve: Curves.easeOut));
  late final _mOffsetAnimation = Tween<Offset>(
    begin: const Offset(0, -0.3),
    end: const Offset(0, 0),
  ).animate(CurvedAnimation(parent: _mController, curve: Curves.easeOut));

  var _mScrollController = ScrollController();

  double _mScrollOffset = 0;
  double _mPerOffset = 5;

  @override
  void initState() {
    _mInfoData = [
      Info(
          caption:
              'Привет, дорогуша! Я сделал этот небольшой сайтик для тебя, ведь я не умею шить, но тоже хочу сделать что-то красивое! Спасибо тебе за котика, он мне так понравился! (попка ваще огонь)',
          asset: _mCatsData[1]),
      Info(
          caption: 'Этот мини-сайтик - тебе! Я полностью понимаю и принимаю твои старания, вижу, как ты пытаешься достичь своего, ты умничка!!',
          asset: _mCatsData[0]),
      Info(
          caption: 'Постарайся побольше думать о существенном и поменьше стрессовать, переживаниями о завтрашнем дне сделаешь хуже только текущему!',
          asset: _mCatsData[2]),
      Info(caption: 'Я в тебя верю, Лера! Ты открыла мне новый мир комфорта!', asset: _mCatsData[3]),
      Info(caption: 'У тебя все получится! Мы справимся со всем вместе!', asset: _mCatsData[5]),
      Info(
          caption: 'Я всегда открыт\nдля тебя и готов выслушать и поддержать, мы всегда можем обменяться советами друг с другом!',
          asset: _mCatsData[7]),
      Info(
          caption:
              'Давай решать проблемы вместе и поменьше унывать, все, что происходит и делается - к лучшему, потраченного времени не вернуть, но можно вынести выводы и сделать будущее лучше!',
          asset: _mCatsData[8]),
      Info(
          caption:
              'Да, какие-то проблемы неописуемо тяжки и могут сильно давить, но я уверен, что все решаемо и реализуемо через адекватное рассуждение обоих сторон! Если человек дорожит этим - он будет открыт к решению проблемы',
          asset: _mCatsData[0]),
      Info(caption: 'Лер, лю тя!', asset: _mCatsData[1]),
    ];
    super.initState();
  }

  void switchView({required int index, Function? onComplete}) {


    _mController.reverse().whenComplete(() {
      _mView = index;
      if (onComplete != null) onComplete();
      setState(() {});
      _mController.forward();
    });

    if (index == 3) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _mScrollController.animateTo(_mScrollController.position.maxScrollExtent, duration: const Duration(seconds: 50), curve: Curves.linear).whenComplete(() {
          _mScrollController.animateTo(_mScrollController.position.minScrollExtent, duration: const Duration(seconds: 50), curve: Curves.linear);
        });
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff9c6096),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                color: Colors.transparent,
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "06.02.2024",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(fontSize: 25, fontFamily: 'Ubuntu', fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                        const SizedBox(width: 10,),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset('assets/cute_cat_roses.jpg', height: 40,))
                      ],
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      transitionBuilder: (child, animation) => FadeTransition(opacity: animation, child: child,),
                      child: _mView == 3 ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CuteButton(caption: 'В начало!', fontSize: 20, onTap: (){
                            switchView(index: 0, onComplete: (){
                              _mShowNegative = true;
                              _mSelectedInfoData = 0;
                            });
                          }),
                        ],
                      ) : const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(_mView == 3 ? 10 : 50),
                  child: Center(
                    child: SlideTransition(
                      position: _mOffsetAnimation,
                      child: FadeTransition(
                        opacity: _mDoubleAnimation,
                        child: Stack(
                          children: [
                            if (_mView == 0)
                              MainCard(
                                isNegativeVisible: _mShowNegative,
                                onTapNegative: () {
                                  switchView(
                                      index: 1,
                                      onComplete: () {
                                        _mShowNegative = false;
                                        Future.delayed(
                                          const Duration(milliseconds: 1500),
                                              () {
                                            switchView(index: 0);
                                          },
                                        );
                                      });
                                },
                                onTapPositive: () {
                                  switchView(index: 2);
                                },
                              ),
                            if (_mView == 1)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Image.asset(
                                  "assets/gif/cute_cat_angry_3.gif",
                                  height: 150,
                                ),
                              ),
                            if (_mView == 2)
                              InfoCard(
                                info: _mInfoData[_mSelectedInfoData],
                                currentIndex: _mSelectedInfoData,
                                totalCount: _mInfoData.length,
                                onPrevPage: () {
                                  switchView(
                                      index: 2,
                                      onComplete: () {
                                        _mSelectedInfoData--;
                                        setState(() {});
                                      });
                                },
                                onNextPage: () {
                                  switchView(
                                      index: 2,
                                      onComplete: () {
                                        _mSelectedInfoData++;
                                        if (_mSelectedInfoData >= _mInfoData.length) {
                                          _mSelectedInfoData = _mInfoData.length - 1;
                                          switchView(index: 3);
                                        }
                                        setState(() {});
                                      });
                                },
                              ),
                            if (_mView == 3)
                              Container(
                                color: Colors.transparent,
                                child: ListView.builder(
                                  itemCount: _mInfoData.length,
                                  scrollDirection: Axis.horizontal,
                                  controller: _mScrollController,
                                  itemBuilder: (context, index) => Padding(
                                      padding: EdgeInsets.only(right: index == _mInfoData.length - 1 ? 0 : 10),
                                      child: InfoListCard(info: _mInfoData[index])),
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 20),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
