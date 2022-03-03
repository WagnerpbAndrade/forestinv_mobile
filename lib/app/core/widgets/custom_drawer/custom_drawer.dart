import 'package:flutter/material.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_drawer/page_section.dart';

import 'custom_drawer_header.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.7;
    return ClipRRect(
      borderRadius: const BorderRadius.horizontal(right: Radius.circular(50)),
      child: SizedBox(
        width: width,
        child: Drawer(
          child: ListView(
            children: [
              CustomDrawerHeader(),
              PageSection(),
            ],
          ),
        ),
      ),
    );
  }
}
