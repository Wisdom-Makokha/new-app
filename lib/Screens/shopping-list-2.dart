import 'package:flutter/material.dart';

class Product{
  const Product({required this.name});

  final String name;
}

typedef CartChangeCallback = Function(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget{
  ShoppingListItem({
    required this.product,
    required this.inCart,
    required this.onCartChanged,
}) : super(key: ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangeCallback onCartChanged;

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
    return ListTile(
      onTap: (){
        onCartChanged(product, inCart);
      },
      selectedTileColor: Colors.blue,
      leading: CircleAvatar(
        backgroundColor: getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(
        product.name,
        style: getTextStyle(context),
      ),
    );
  }
}

class ShoppingList extends StatefulWidget{
  const ShoppingList({required this.products, super.key});

  final List<Product> products;

  @override
  State<ShoppingList> createState() => ShoppingListState();
}

class ShoppingListState extends State<ShoppingList>{
  final shoppingCart = <Product>{};

  void handleCartChanged(Product product, bool inCart){
    setState((){
      if(!inCart){
        shoppingCart.add(product);
      }else{
        shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping list"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: widget.products.map((product){
          return ShoppingListItem(
            product: product,
            inCart: shoppingCart.contains(product),
            onCartChanged: handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}