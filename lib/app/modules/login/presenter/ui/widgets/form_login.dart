// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
// import 'package:forestinv_mobile/app/core/widgets/custom_text_form_field.dart';
// import 'package:forestinv_mobile/app/modules/login/presenter/output/controller/login_controller.dart';
// import 'package:forestinv_mobile/app/modules/login/presenter/output/stores/login_store.dart';
// import 'package:forestinv_mobile/app/modules/login/presenter/ui/widgets/components/login_button.dart';
// import 'package:form_field_validator/form_field_validator.dart';

// class FormLogin extends StatefulWidget {
//   @override
//   State<FormLogin> createState() => _FormLoginState();
// }

// class _FormLoginState extends State<FormLogin> {
//   final GlobalKey<FormState> formStateKey = GlobalKey<FormState>();
//   final store = Modular.get<LoginStore>();
//   final controller = Modular.get<LoginController>();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Form(
//           key: formStateKey,
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),
//               Observer(builder: (context) {
//                 return CustomTextFormField(
//                   controller: controller.emailController,
//                   label: "Email",
//                   icon: const Icon(
//                     Icons.email,
//                     color: ColorsConst.secondary,
//                   ),
//                   validator: MultiValidator([
//                     EmailValidator(errorText: 'Informe seu email'),
//                     RequiredValidator(errorText: 'Informe seu email'),
//                   ]),
//                   textError: emailError(),
//                   valido: !store.temErroFirebase
//                       ? store.errorEmail
//                       : store.temErroFirebase,
//                   isPassWord: false,
//                   textType: TextInputType.emailAddress,
//                 );
//               }),
//               Observer(
//                 builder: (context) {
//                   return CustomTextFormField(
//                     controller: controller.passwordController,
//                     label: "Senha",
//                     icon: const Icon(
//                       Icons.lock,
//                       color: ColorsConst.secondary,
//                     ),
//                     validator: MultiValidator([
//                       RequiredValidator(errorText: 'Informe sua senha'),
//                     ]),
//                     textError: store.textoErroSenha,
//                     valido: store.erroSenha,
//                     isPassWord: true,
//                     textType: TextInputType.text,
//                   );
//                 },
//               ),
//               Align(
//                 alignment: Alignment.topRight,
//                 child: TextButton(
//                   onPressed: () {
//                     controller.goToRecoveryPasswordPage();
//                   },
//                   child: const Text(
//                     "Esqueci minha senha",
//                     style: TextStyle(color: ColorsConst.primary),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Observer(builder: (context) {
//                 //store.botaoLoading;
//                 return LoginButton(
//                   onPressed: () async {
//                     if (formStateKey.currentState!.validate()) {
//                       final response =
//                           await controller.siginWithEmailAndPassword();

//                       if (!response.ok) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text(
//                               response.message ?? '',
//                               style: const TextStyle(
//                                 color: ColorsConst.textColorPrimary,
//                               ),
//                             ),
//                             backgroundColor: ColorsConst.primary,
//                             action: SnackBarAction(
//                               label: 'Ok',
//                               onPressed: () {},
//                             ),
//                             duration: const Duration(milliseconds: 1500),
//                           ),
//                         );
//                       }
//                     }
//                   },
//                   title: "ENTRAR",
//                 );
//               }),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.03,
//               ),
//               const Text(
//                 "OU",
//                 style: TextStyle(
//                     color: ColorsConst.primary, fontWeight: FontWeight.w500),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   String emailError() {
//     if (store.errorEmail) {
//       return store.textoErroEmail;
//     } else if (store.temErroFirebase) {
//       return store.textoErroFirebase;
//     }
//     return "";
//   }
// }
