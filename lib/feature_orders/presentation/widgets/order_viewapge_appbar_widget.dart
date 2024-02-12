import 'package:flutter/material.dart';

class OrderViewpageAppbarWidget extends StatelessWidget {
  const OrderViewpageAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
        child: Row(
          children: [
            Image.asset(''),
            Text('')
          ],
        ),
      ),
    );
  }
}
