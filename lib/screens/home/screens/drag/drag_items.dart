import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'drag_parts/item.dart';
import 'drag_parts/item_done.dart';

class DragScreen extends StatefulWidget {
  static String tag = '/IMDraggableScreen2';

  @override
  _DragScreenState createState() => _DragScreenState();
}

class _DragScreenState extends State<DragScreen> with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  var mValue = false;
  var _mStatus = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    var itemImage =
        'https://www.freepnglogos.com/uploads/tea-png/tea-top-afternoon-teas-around-the-red-letter-days-blog-8.png';

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Pick Your Shop Items"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _mStatus
                ? const ItemDone()
                : Draggable(
                    data: 5,
                    childWhenDragging: Center(
                      child: ItemImage(
                        itemImage: itemImage,
                      ),
                    ),
                    onDragStarted: () {
                      mValue = true;
                      print("onDragStarted" + mValue.toString());
                    },
                    onDraggableCanceled: (Velocity velocity, Offset offset) {
                      setState(() {
                        mValue = false;
                        print("onDraggableCanceled" + mValue.toString());
                      });
                    },
                    feedback: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Opacity(
                        opacity: 0.7,
                        child: ItemImage(
                          itemImage: itemImage,
                        ),
                      ),
                    ),
                    child: ItemImage(
                      itemImage: itemImage,
                    ),
                  ),
            DragTarget(
              builder: (context, List<int?> candidateData, rejectedData) {
                return AnimatedCrossFade(
                  duration: const Duration(milliseconds: 200),
                  firstChild: SvgPicture.asset(
                    'assets/icons/open_box1.svg',
                    semanticsLabel: 'Acme Logo',
                    height: 175,
                    width: 175,
                  ),
                  secondChild: SvgPicture.asset(
                    'assets/icons/open_box.svg',
                    semanticsLabel: 'Acme Logo',
                    height: 175,
                    width: 175,
                  ),
                  crossFadeState: mValue
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                );
              },
              onWillAccept: (data) {
                return true;
              },
              onAccept: (data) {
                if (data == 5) {
                  mValue = false;

                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(
                          "hi hello ",
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      );
                    },
                  );

                  // ScaffoldMessenger.of(context)
                  //     .showSnackBar(SnackBar(content: Text("Done")));
                  setState(() {
                    _mStatus = true;
                  });
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
