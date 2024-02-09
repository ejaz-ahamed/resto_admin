import 'package:flutter/material.dart';
import 'package:resto_admin/core/widgets/add_image_widget.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 116,
                child: AddImageWidget(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
