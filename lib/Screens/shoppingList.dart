import 'package:flutter/material.dart';

class Product{
  const Product({required this.name});

  final String name;
}

typedef CartChangedCallback = Function(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget{
  ShoppingListItem({
    required this.product,
    required this.inCart,
    required this.onCartChanged,
}) : super(key: ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color getColor(BuildContext context){
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle? getTextStyle(BuildContext context){
    if(inCart) return null;

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping list'),
      ),
      body: ListTile(
        onTap: (){
          onCartChanged(product, inCart);
        },
        leading: CircleAvatar(
          backgroundColor: getColor(context),
          child: Text(product.name[0]),
        ),
        title: Text(product.name, style: getTextStyle(context),),
      ),
    );
  }
}