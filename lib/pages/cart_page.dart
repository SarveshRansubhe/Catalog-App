import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catelog/core/store.dart';
import 'package:flutter_catelog/models/cart.dart';
import 'package:flutter_catelog/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Cart".text.make(),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatefulWidget {
  @override
  __CartTotalState createState() => __CartTotalState();
}

class __CartTotalState extends State<_CartTotal> {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(
            mutations: {RemoveMutation},
            builder: (
              context,
              _,
            ) {
              return "\$${_cart.totalPrice}"
                  .text
                  .xl5
                  .color(context.theme.colorScheme.secondary)
                  .make();
            },
          ),
          30.widthBox,
          ElevatedButton(
            child: "Buy".text.white.make(),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(context.backgroundColor)),
            onPressed: () {
              showCupertinoDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (BuildContext context) => CupertinoAlertDialog(
                        title: Text("Confirm Message"),
                        content: Text(
                            "Are you sure you want to spent \$${_cart.totalPrice}"),
                        actions: [
                          CupertinoDialogAction(
                            child: Text("NO"),
                            onPressed: () => Navigator.pop(context),
                          ),
                          CupertinoDialogAction(
                            child: Text("YES"),
                            onPressed: () =>
                                Navigator.pushNamed(context, MyRoutes.endRoute),
                          ),
                        ],
                      ));
            },
          ).w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.listen(context, to: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items?.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () {
                  RemoveMutation(_cart.items[index]);
                },
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
