// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
// import 'package:forestinv_mobile/app/core/widgets/custom_button.dart';
// import 'package:forestinv_mobile/app/core/widgets/custom_text_form_field.dart';
// import 'package:forestinv_mobile/app/modules/login/infra/models/user_model.dart';
// import 'package:forestinv_mobile/app/modules/login/presenter/output/controller/sign_up_controller.dart';
// import 'package:forestinv_mobile/app/modules/login/presenter/output/stores/sign_up_store.dart';

// class SignUpPage extends StatelessWidget {
//   const SignUpPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final store = Modular.get<SignUpStore>();
//     final controller = Modular.get<SignUpController>();

//     cleanInputFields(controller);

//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Container(
//             margin: const EdgeInsets.only(right: 56),
//             child: const Text(
//               "CRIAR CONTA",
//               style: TextStyle(
//                 color: ColorsConst.textColorPrimary,
//                 fontWeight: FontWeight.w400,
//                 wordSpacing: 2,
//               ),
//             ),
//           ),
//         ),
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "CADASTRE-SE",
//                 style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w700,
//                     color: ColorsConst.primary),
//               ),
//               const SizedBox(
//                 height: 40,
//               ),
//               SizedBox(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Observer(
//                       builder: (context) {
//                         return CustomTextFormField(
//                           controller: controller.txtEmailController,
//                           label: "Email",
//                           icon: const Icon(
//                             Icons.email,
//                             color: ColorsConst.primary,
//                           ),
//                           onChanged: (value) {
//                             store.email = value.toString();

//                             store.validarEmail();
//                           },
//                           textError: store.textoErroEmail,
//                           valido: store.errorEmail,
//                           isPassWord: false,
//                           textType: TextInputType.name,
//                         );
//                       },
//                     ),
//                     Observer(
//                       builder: (context) {
//                         return CustomTextFormField(
//                           controller: controller.txtPasswordController,
//                           label: "Senha",
//                           icon: const Icon(
//                             Icons.lock,
//                             color: ColorsConst.primary,
//                           ),
//                           onChanged: (value) {
//                             store.senha = value.toString();
//                             store.validarSenhaComCampoConfirmacao();
//                           },
//                           textError: store.textoErroSenha,
//                           valido: store.erroSenha,
//                           isPassWord: true,
//                           textType: TextInputType.name,
//                         );
//                       },
//                     ),
//                     Observer(
//                       builder: (context) {
//                         return CustomTextFormField(
//                           controller:
//                               controller.txtPasswordConfirmationController,
//                           label: "Confirmação de Senha",
//                           icon: const Icon(
//                             Icons.lock,
//                             color: ColorsConst.primary,
//                           ),
//                           onChanged: (value) {
//                             store.confirmacaoSenha = value.toString();
//                             store.validarConfirmacaoSenha();
//                           },
//                           textError: store.textoErroConfirmacaoSenha,
//                           valido: store.erroConfirmacaoSenha,
//                           isPassWord: true,
//                           textType: TextInputType.name,
//                         );
//                       },
//                     ),
//                     CustomButton(
//                       action: () async {
//                         if (store.validarEmail() &&
//                             store.validarSenha() &&
//                             store.validarConfirmacaoSenha()) {
//                           final apiResponse =
//                               await controller.createUserFirebase();
//                           if (apiResponse.ok) {
//                             final UserModelFirebase user = apiResponse.result;
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 content: Text(
//                                   'Usuário ${user.email} criado com sucesso',
//                                   style: const TextStyle(
//                                     color: ColorsConst.textColorPrimary,
//                                   ),
//                                 ),
//                                 backgroundColor: ColorsConst.primary,
//                                 action: SnackBarAction(
//                                   textColor: ColorsConst.textColorPrimary,
//                                   label: 'Ok',
//                                   onPressed: () {},
//                                 ),
//                                 duration: const Duration(milliseconds: 1500),
//                               ),
//                             );
//                           } else {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 content: Text(
//                                   apiResponse.message!,
//                                   style: const TextStyle(
//                                     color: ColorsConst.textColorPrimary,
//                                   ),
//                                 ),
//                                 backgroundColor: ColorsConst.primary,
//                                 action: SnackBarAction(
//                                   textColor: ColorsConst.textColorPrimary,
//                                   label: 'Ok',
//                                   onPressed: () {},
//                                 ),
//                                 duration: const Duration(milliseconds: 1500),
//                               ),
//                             );
//                           }
//                         }
//                       },
//                       title: "Salvar",
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void cleanInputFields(SignUpController controller) {
//     controller.txtEmailController.text = '';
//     controller.txtPasswordController.text = '';
//     controller.txtPasswordConfirmationController.text = '';
//   }
// }
