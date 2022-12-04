import 'dart:convert';

import 'package:bubbles/core/enum.dart';
import 'package:flutter/material.dart';

import '../../../theme/theme.theme.dart';

class BubbleStack extends StatelessWidget {
  final String text;
  final Widget fillWidget;
  final Widget contentWidget;
  final DiadicRole role;

  const BubbleStack(
      {required this.text,
      required this.fillWidget,
      required this.contentWidget,
      required this.role});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        fillWidget,
        Positioned(
          top: -31,
          left: 0,
          right: 0,
          child: contentWidget,
        ),
      ],
    );
  }
}
/*
  Widget _getEmotionOverlay(ChatListItemData chatItem, BuildContext context) {
    if (chatItem.gameData != null) {
      return _getEmotionGameOverlay(chatItem, context);
    }

    final defaultContainer = Container(
      height: 30,
      width: 30,
    );

    List<Widget> children = [defaultContainer, defaultContainer];

    Map content;
    String imageName;
    Widget container;

    final userId = context.read<UserCubit>().state.user.matrixId;

    if (chatItem.connectedItems.length > 0) {
      for (var element in chatItem.connectedItems) {
        if (element.type == MessageTypes.Emote) {
          content = json.decode(element.content);
          imageName = json.decode(content['content']['body'])['emotion'];
          container = Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(DiadicThemeMaterial.borderRadius),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
                image: Image.asset(
                  'assets/images/icons/emotions/' + imageName,
                ).image,
              ),
            ),
          );
          if (element.userId == userId) {
            children[1] = container;
          } else {
            children[0] = container;
          }
        }
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      ),
    );
  }

  Widget _getEmotionGameOverlay(ChatListItemData chatItem, BuildContext context) {
    // if(chatItem.gameData != null )

    if (!chatItem.gameData!.finished) {
      return Container(
        padding: EdgeInsets.all(30),
        height: 180,
        child: Row(
          children: [
            Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(DiadicThemeMaterial.borderRadius),
                  ),
                ),
                child: Image.asset('assets/images/backgrounds/dice.png')),
            Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(DiadicThemeMaterial.borderRadius),
                  ),
                ),
                child: Image.asset('assets/images/backgrounds/dice.png')),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.all(30),
        height: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(DiadicThemeMaterial.borderRadius),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      alignment: Alignment.bottomCenter,
                      image: Image.asset(EmotionMapping
                              .intToPath[chatItem.gameData!.partnerOwn!])
                          .image,
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(DiadicThemeMaterial.borderRadius),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      alignment: Alignment.bottomCenter,
                      image: Image.asset(EmotionMapping
                              .intToPath[chatItem.gameData!.choiceOwn!])
                          .image,
                    ),
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(DiadicThemeMaterial.borderRadius),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      alignment: Alignment.bottomCenter,
                      image: Image.asset(EmotionMapping
                              .intToPath[chatItem.gameData!.partnerPartner!])
                          .image,
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(DiadicThemeMaterial.borderRadius),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      alignment: Alignment.bottomCenter,
                      image: Image.asset(EmotionMapping
                              .intToPath[chatItem.gameData!.choicePartner!])
                          .image,
                    ),
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ],
        ),
      );
    }

    final defaultContainer = Container(
      height: 30,
      width: 30,
    );

    List<Widget> children = [defaultContainer, defaultContainer];

    Map content;
    String imageName;
    Widget container;

    final userId = context.read<UserCubit>().state.user.matrixId;

    if (chatItem.connectedItems.length > 0) {
      for (var element in chatItem.connectedItems) {
        if (element.type == MessageTypes.Emote) {
          content = json.decode(element.content);
          imageName = json.decode(content['content']['body'])['emotion'];
          container = Container(
            width: 30,
            height: 30,
            child: Image.asset(
              'assets/images/icons/emotions/' + imageName,
            ),
          );
          if (element.userId == userId) {
            children[1] = container;
          } else {
            children[0] = container;
          }
        }
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      ),
    );
  }
}
*/