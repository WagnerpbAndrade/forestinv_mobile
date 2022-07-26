import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/auth/auth_store.dart';

class CustomDrawerHeader extends StatelessWidget {
  final authStore = Modular.get<AuthStore>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const Icon(
            Icons.person,
            size: 35,
          ),
          Expanded(
            child: Text(
              authStore.isLoggedIn ? authStore.user!.nome : '',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              authStore.isLoggedIn ? authStore.user!.email : '',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
