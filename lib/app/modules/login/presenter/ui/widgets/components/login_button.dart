// import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
// import 'package:forestinv_mobile/app/modules/login/presenter/output/controller/login_controller.dart';
// import 'package:forestinv_mobile/app/modules/login/presenter/output/stores/login_store.dart';

// class LoginButton extends StatelessWidget {
//   final Function onPressed;
//   final String title;

//   LoginButton({required this.onPressed, required this.title});

//   final controller = Modular.get<LoginController>();
//   final store = Modular.get<LoginStore>();

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 50,
//       width: double.infinity,
//       child: ElevatedButton(
//         style: ButtonStyle(
//           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//             const RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//             ),
//           ),
//           backgroundColor:
//               MaterialStateProperty.all<Color>(ColorsConst.secondary),
//         ),
//         onPressed: () => onPressed(),
//         child: !store.botaoLoading
//             ? Text(
//                 title,
//                 style: const TextStyle(color: ColorsConst.textColorPrimary),
//               )
//             : Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     title,
//                     style: const TextStyle(color: ColorsConst.primary),
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   const SizedBox(
//                     width: 20,
//                     height: 20,
//                     child: CircularProgressIndicator(
//                       strokeWidth: 2,
//                       color: ColorsConst.textColorPrimary,
//                     ),
//                   )
//                 ],
//               ),
//       ),
//     );
//   }
// }
