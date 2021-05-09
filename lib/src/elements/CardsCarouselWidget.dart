import 'package:flutter/material.dart';
import 'package:food_delivery_app/src/models/route_argument.dart';

import '../elements/CardsCarouselLoaderWidget.dart';
import '../models/restaurant.dart';
import 'CardWidget.dart';

// ignore: must_be_immutable
class CardsCarouselWidget extends StatefulWidget {
  List<Restaurant> restaurantsList;
  String heroTag;

  CardsCarouselWidget({Key key, this.restaurantsList, this.heroTag})
      : super(key: key);

  @override
  _CardsCarouselWidgetState createState() => _CardsCarouselWidgetState();
}

class _CardsCarouselWidgetState extends State<CardsCarouselWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.restaurantsList.isEmpty
        ? CardsCarouselLoaderWidget()
        : SingleChildScrollView(
                  child: Container(

              child: Column(children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/Details',
                      arguments: RouteArgument(
                        id: '0',
                        param: widget.restaurantsList.elementAt(0).id,
                        heroTag: widget.heroTag,
                      ));
                },
                                child: CardWidget(
                      restaurant: widget.restaurantsList.elementAt(0),
                      heroTag: widget.heroTag),
                ),
                  
                   GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/Details',
                      arguments: RouteArgument(
                        id: '0',
                        param: widget.restaurantsList.elementAt(1).id,
                        heroTag: widget.heroTag,
                      ));
                },
                                child: CardWidget(
                      restaurant: widget.restaurantsList.elementAt(1),
                      heroTag: widget.heroTag),
                ),
                   GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/Details',
                      arguments: RouteArgument(
                        id: '0',
                        param: widget.restaurantsList.elementAt(2).id,
                        heroTag: widget.heroTag,
                      ));
                },
                                child: CardWidget(
                      restaurant: widget.restaurantsList.elementAt(2),
                      heroTag: widget.heroTag),
                )
             
              ]
              ),
            ),
        );
    //  Container(
    //     height: 400,
    //     child: ListView.builder(
    //       scrollDirection: Axis.vertical,
    //       itemCount: widget.restaurantsList.length,
    //       itemBuilder: (context, index) {
    //         return GestureDetector(
    //           onTap: () {
    //             Navigator.of(context).pushNamed('/Details',
    //                 arguments: RouteArgument(
    //                   id: '0',
    //                   param: widget.restaurantsList.elementAt(index).id,
    //                   heroTag: widget.heroTag,
    //                 ));
    //           },
    //           child: Column(
    //             children: [
    //               CardWidget(restaurant: widget.restaurantsList.elementAt(0), heroTag: widget.heroTag),
    //             ],
    //           ),
    //         );
    //       },
    //     ),
    //   );
    // }
  }
}
