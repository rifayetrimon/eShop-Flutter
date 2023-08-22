import 'package:market/consts/consts.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.teal,
        child: "Cart is Empty!"
            .text
            .fontFamily(semibold)
            .color(darkFontGrey)
            .makeCentered());
  }
}
