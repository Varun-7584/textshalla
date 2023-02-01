import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:textshalla/comps/widgets.dart';
import 'package:textshalla/chating/homepage.dart';
import '../chating/chatpage.dart';


class AnimatedDialog extends StatefulWidget {
  final double height;
  final double width;

  const AnimatedDialog({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  State<AnimatedDialog> createState() => _AnimatedDialogState();
}

class _AnimatedDialogState extends State<AnimatedDialog> {
  bool show = false;

  get data => null;
  @override
  Widget build(BuildContext context) {
    if(widget.height != 0){
      Timer(const Duration(milliseconds: 200), () {
        setState(() {
          show = true;
        });
      });
    }else{
      setState(() {
        show = false;
      });
    }

    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
              color:widget.width == 0 ? Colors.indigo.withOpacity(0):  Colors.indigo.shade400,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(widget.width == 0 ? 100 : 0),
                bottomRight: Radius.circular(widget.width == 0 ? 100 : 0),
                bottomLeft: Radius.circular(widget.width == 0 ? 100 : 0),
              )),
          child: widget.width == 0 ? null : !show ? null :  Column(
            children: [
              ChatWidgets.searchField(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, i) {
                      return ChatWidgets.card(
                        title: data[i]['name'],
                        time: DateFormat('EEE hh:mm'),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ChatPage(
                                  id: data[i].id.toString(),
                                  name: data[i]['name'],
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}