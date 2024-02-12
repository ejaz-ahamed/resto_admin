import 'package:flutter/material.dart';
import 'package:resto_admin/features/authentication/presentation/widgets/bottom_nav_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNaviWidget(),
    );
  }
}