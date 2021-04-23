import 'package:flutter/material.dart';
import 'package:food_delivery_app/src/controllers/food_controller.dart';

import '../helpers/helper.dart';
import '../models/extra.dart';

class ExtraItemWidget extends StatefulWidget {
  final Extra extra;
  int index;
  final FoodController con;
  final VoidCallback onChanged;
  ExtraItemWidget({
    Key key,
    this.extra,
    this.onChanged,
    this.con,
    this.index,
  }) : super(key: key);

  @override
  _ExtraItemWidgetState createState() => _ExtraItemWidgetState();
}

class _ExtraItemWidgetState extends State<ExtraItemWidget>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  Animation<double> sizeCheckAnimation;
  Animation<double> rotateCheckAnimation;
  Animation<double> opacityAnimation;
  Animation opacityCheckAnimation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(milliseconds: 350), vsync: this);
    CurvedAnimation curve =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation = Tween(begin: 0.0, end: 60.0).animate(curve)
      ..addListener(() {
        setState(() {});
      });
    opacityAnimation = Tween(begin: 0.0, end: 0.5).animate(curve)
      ..addListener(() {
        setState(() {});
      });
    opacityCheckAnimation = Tween(begin: 0.0, end: 1.0).animate(curve)
      ..addListener(() {
        setState(() {});
      });
    rotateCheckAnimation = Tween(begin: 2.0, end: 0.0).animate(curve)
      ..addListener(() {
        setState(() {});
      });
    sizeCheckAnimation = Tween<double>(begin: 0, end: 36).animate(curve)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  int index = 0;
  List pizzaGrouop = [];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // widget.con.setIndex(3);
        // print(widget.con.index);
        if (widget.con.index.length != 0) {
          if (widget.con.index.contains(int.parse(widget.extra.id))) {
            widget.con.index = [];
            animationController.reverse();
            widget.extra.checked = 3;
            widget.onChanged();
            // SnackBar(content:Text("يجب اختيار عنصر واحد"));
          }
        } else {
          animationController.forward();
          

          widget.con.setIndex(int.parse(widget.extra.id));
          print(widget.con.index);
          widget.extra.checked = int.parse(widget.extra.id);
          widget.onChanged();
          // widget.con.setIndex(widget.index);
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(60)),
                  image: DecorationImage(
                      image: NetworkImage(widget.extra.image?.thumb),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                height: animation.value,
                width: animation.value,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(60)),
                  color: Theme.of(context)
                      .accentColor
                      .withOpacity(opacityAnimation.value),
                ),
                child: Transform.rotate(
                  angle: rotateCheckAnimation.value,
                  child: Icon(
                    Icons.check,
                    size: sizeCheckAnimation.value,
                    color: Theme.of(context)
                        .primaryColor
                        .withOpacity(opacityCheckAnimation.value),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 15),
          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.extra?.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Text(
                        Helper.skipHtml(widget.extra.description),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Helper.getPrice(widget.extra.price, context,
                    style: Theme.of(context).textTheme.headline4),
              ],
            ),
          )
        ],
      ),
    );
  }
}
