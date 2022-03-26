import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'produt_cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: firstColor,
          title: Text('Produt Cart'),
        ),
        body: ChangeNotifierProvider(
          create: (context) => ProductState(),
          child: Container(
            margin: EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.topCenter,
              child: Consumer<ProductState>(
                builder: (context, productState, _) => ProdutCart(
                  imageURL:
                      'https://i.pinimg.com/564x/40/d9/be/40d9beee2bc34ff545dc5eccd3ea2a94.jpg',
                  name: 'Buah-Buhan Mix 1 kg',
                  price: 'Rp25.000',
                  notification:
                      (productState.quantity > 5) ? 'Diskon 10%' : null,
                  quantity: productState.quantity,
                  onIncTap: () {
                    productState.quantity++;
                  },
                  onDecTap: () {
                    productState.quantity--;
                  },
                  onAddChartTap: () {},
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductState with ChangeNotifier {
  int _quantity = 0;
  get quantity => _quantity;

  set quantity(int newValue) {
    _quantity = newValue;
    notifyListeners();
  }
}
