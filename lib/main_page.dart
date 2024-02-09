import 'dart:async';

import 'package:auto_scroll/auto_scroll.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'package:untitled/info_card.dart';
import 'package:untitled/info_list_card.dart';
import 'package:untitled/lera_button.dart';
import 'package:untitled/main_card.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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


  final List<String> _mCatsData = [
    'assets/gifs_array/cat_0.gif',
    'assets/gifs_array/cat_1.gif',
    'assets/gifs_array/cat_2.gif',
    'assets/gifs_array/cat_3.gif',
    'assets/gifs_array/cat_4.gif',
    'assets/gifs_array/cat_5.gif',
    'assets/gifs_array/cat_6.gif',
    'assets/gifs_array/cat_7.gif',
    'assets/gifs_array/cat_8.gif',
    'assets/gifs_array/cat_9.gif',
    'assets/gifs_array/cat_10.gif',
    'assets/gifs_array/cat_11.gif',
    'assets/gifs_array/cat_12.gif',
    'assets/gifs_array/cat_13.gif',
    'assets/gifs_array/cat_14.gif',
  ];

  List<Info> _mInfoData = [];

  late final _mController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500))..forward();
  late final _mDoubleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _mController, curve: Curves.easeOut));
  late final _mOffsetAnimation = Tween<Offset>(
    begin: const Offset(0, -0.3),
    end: const Offset(0, 0),
  ).animate(CurvedAnimation(parent: _mController, curve: Curves.easeOut));

  var _mScrollController = ScrollController();

  @override
  void initState() {
    startPlayer();
    _mInfoData = [
      Info(
          caption:
              'Привет, дорогуша! Я сделал этот небольшой сайтик для тебя, ведь я не умею шить, но тоже хочу сделать что-то красивое! Спасибо тебе за котика, он мне так понравился! (попка ваще огонь)❤️💥',
          asset: _mCatsData[1]),
      Info(
          caption: 'Постарайся побольше думать о существенном и поменьше стрессовать, переживаниями о завтрашнем дне сделаешь хуже только текущему! (а еще лучше - думай обо мне😘😌)',
          asset: _mCatsData[14]),
      Info(caption: 'Я в тебя верю, Лера! Ты открыла мне новый мир комфорта!😽', asset: _mCatsData[3]),
      Info(caption: 'У тебя все получится, ты умница! Даже если чувствуешь, что где-то что-то может пойти не так, то это нормально!❣️'
          'На этих ошибках мы учимся, становимся сильнее, идем по тропе жизни. Помни, что ты не одна, мы справимся со всем вместе!', asset: _mCatsData[5]),
      Info(
          caption: 'Я всегда открыт\nдля тебя и готов выслушать и поддержать, мы всегда можем обменяться советами друг с другом!💗',
          asset: _mCatsData[7]),
      Info(
          caption:
              'Давай решать проблемы вместе и поменьше унывать, все, что происходит и делается - к лучшему, потраченного времени не вернуть, но можно вынести выводы и сделать будущее лучше!🫶',
          asset: _mCatsData[8]),
      Info(
          caption:
              'Да, какие-то проблемы неописуемо тяжки и могут сильно давить, но я уверен, что все решаемо через адекватное рассуждение обоих сторон! Если человек дорожит этим - он будет открыт к решению проблемы💋',
          asset: _mCatsData[9]),
      Info(
          caption: 'Давай просто быть друг у друга, поддерживать, разделять моменты жизни, делиться всем! Особенно, ценить взаимопонимание💫',
          asset: _mCatsData[13]),
      Info(caption: 'Лер, так дорожу тобой! Я вижу в тебе ответственного и приятного человека, который умеет стараться, не покладая рук. Лю!❤️‍🔥', asset: _mCatsData[12]),
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
      try{
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          _mScrollController.animateTo(_mScrollController.position.maxScrollExtent, duration: const Duration(seconds: 50), curve: Curves.linear).whenComplete(() {
            _mScrollController.animateTo(_mScrollController.position.minScrollExtent, duration: const Duration(seconds: 50), curve: Curves.linear);
          });
        });
      }catch(ex){print(ex.toString());}

    }
  }


  @override
  void dispose() {
    _mController.dispose();
    _mScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff9c6096),
      body: Stack(
        children: [
          Container(
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
          Container(
            color: Colors.transparent,
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  transitionBuilder: (child, animation) => FadeTransition(opacity: animation, child: child,),
                  child: _mView == 3 ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CuteButton(caption: 'ТЫК!', fontSize: 20, onTap: () async {
                        await launchUrl(Uri.parse('https://www.youtube.com/watch?v=bgjUzhdmmF0&ab_channel=harisego'));
                      }),
                    ],
                  ) : const SizedBox.shrink(),
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  transitionBuilder: (child, animation) => FadeTransition(opacity: animation, child: child,),
                  child: _mView == 0 ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "06.02.2024",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(fontSize: 25, fontFamily: 'Ubuntu', fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                      const SizedBox(width: 10,),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset('assets/cute_cat_roses.jpg', height: 40,))
                    ],
                  ) : const SizedBox.shrink(),
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

        ],
      ),
    );
  }

  void startPlayer() async {
   /*final player = AudioPlayer();
    await player.play(AssetSource('assets/sounds/sound.mp3'));*/
  }
}
