import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
import 'package:forestinv_mobile/app/core/widgets/error_box.dart';
import 'package:forestinv_mobile/app/core/widgets/field_title.dart';
import 'package:forestinv_mobile/app/core/widgets/replace_raisedbutton.dart';
import 'package:forestinv_mobile/app/modules/login/presenter/output/stores/recovery_password_store.dart';
import 'package:mobx/mobx.dart';

class RecoverPage extends StatefulWidget {
  const RecoverPage(this.email);

  final String? email;

  @override
  _RecoverScreenState createState() => _RecoverScreenState(email);
}

class _RecoverScreenState extends State<RecoverPage> {
  _RecoverScreenState(email) : recoverStore = RecoveryPasswordStore(email);

  final RecoveryPasswordStore recoverStore;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  ReactionDisposer? disposer;

  @override
  void initState() {
    super.initState();

    disposer = reaction((_) => recoverStore.success, (bool s) {
      if (s) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Link de recuperação enviado para o E-mail informado',
            style: TextStyle(
              color: Colors.purple,
            ),
          ),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
        ));
      }
    });
  }

  @override
  void dispose() {
    disposer!();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: ColorsConst.primary,
        key: scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          title: const Text('Recuperar Senha'),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: SingleChildScrollView(
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Observer(
                      builder: (_) {
                        if (recoverStore.error != null) {
                          return ErrorBox(
                            message: recoverStore.error,
                          );
                        } else {
                          return const SizedBox(
                            height: 8,
                          );
                        }
                      },
                    ),
                    const FieldTitle(
                      title: 'Confirme seu E-mail',
                      subtitle: 'Enviaremos um link para recuperaçao',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Observer(
                      builder: (_) {
                        return TextFormField(
                          initialValue: recoverStore.email,
                          enabled: !recoverStore.loading,
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: 'Exemplo: wagner@gmail.com',
                            isDense: true,
                            errorText: recoverStore.emailError,
                          ),
                          onChanged: recoverStore.setEmail,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Observer(
                      builder: (_) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 12),
                          height: 40,
                          child: ReplaceRaisedButton(
                            color: ColorsConst.secondary,
                            textColor: Colors.white,
                            child: recoverStore.loading
                                ? const CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.white),
                                  )
                                : const Text(
                                    'Enviar',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                            elevation: 0,
                            onPressed: recoverStore.recoverPressed,
                            disabledColor: ColorsConst.secondary.withAlpha(120),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
