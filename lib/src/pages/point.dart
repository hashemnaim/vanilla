import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../generated/l10n.dart';
import '../controllers/profile_controller.dart';
import '../elements/DrawerWidget.dart';

import '../elements/PermissionDeniedWidget.dart';
import '../elements/ShoppingCartButtonWidget.dart';
import '../repository/user_repository.dart';

class PointScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> parentScaffoldKey;

  PointScreen({Key key, this.parentScaffoldKey}) : super(key: key);
  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends StateMVC<PointScreen> {
  ProfileController _con;

  _ProfileWidgetState() : super(ProfileController()) {
    _con = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      drawer: DrawerWidget(),
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.sort, color: Theme.of(context).primaryColor),
          onPressed: () => _con.scaffoldKey?.currentState?.openDrawer(),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).accentColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          S.of(context).points,
          style: Theme.of(context).textTheme.headline6.merge(TextStyle(
              letterSpacing: 1.3, color: Theme.of(context).primaryColor)),
        ),
        actions: <Widget>[
          new ShoppingCartButtonWidget(
              iconColor: Theme.of(context).primaryColor,
              labelColor: Theme.of(context).hintColor),
        ],
      ),
      body: currentUser.value.apiToken == null
          ? PermissionDeniedWidget()
          : SingleChildScrollView(
//              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  // ProfileAvatarWidget(user: currentUser.value),
                  // ListTile(
                  //   contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  //   leading: Icon(
                  //     Icons.person,
                  //     color: Theme.of(context).hintColor,
                  //   ),
                  //   title: Text(
                  //     S.of(context).about,
                  //     style: Theme.of(context).textTheme.headline4,
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20),
                  //   child: Text(
                  //     currentUser.value?.bio ?? "",
                  //     style: Theme.of(context).textTheme.bodyText2,
                  //   ),
                  // ),
                  Text(
                    S.of(context).points + "   863",
                    style: Theme.of(context).textTheme.headline4,
                  ),

                  // _con.recentOrders.isEmpty
                  //     ? EmptyOrdersWidget()
                  //     : ListView.separated(
                  //         scrollDirection: Axis.vertical,
                  //         shrinkWrap: true,
                  //         primary: false,
                  //         itemCount: _con.recentOrders.length,
                  //         itemBuilder: (context, index) {
                  //           var _order = _con.recentOrders.elementAt(index);
                  //           return OrderItemWidget(expanded: index == 0 ? true : false, order: _order);
                  //         },
                  //         separatorBuilder: (context, index) {
                  //           return SizedBox(height: 20);
                  //         },
                  //       ),
                  // _con.recentOrders.isEmpty
                  //     ? EmptyOrdersWidget()
                  //     :
                       Center(
                          child: Container(
                            height: 200,
                            width: 200,
                            child: LiquidCircularProgressIndicator(
                              value: 0.5, // Defaults to 0.5.
                              valueColor: AlwaysStoppedAnimation(Colors
                                  .amber), // Defaults to the current Theme's accentColor.
                              backgroundColor: Colors
                                  .white, // Defaults to the current Theme's backgroundColor.
                              borderColor: Colors.black,
                              borderWidth: 5.0,

                              direction: Axis
                                  .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                              center: Text("2334"),
                            ),
                          ),
                        ),
                ],
              ),
            ),
    );
  }
}
