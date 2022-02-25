import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
import 'package:forestinv_mobile/app/core/constants/router_const.dart';
import 'package:forestinv_mobile/app/core/widgets/replace_raisedbutton.dart';

class CreateProjetoButton extends StatefulWidget {
  const CreateProjetoButton(this.scrollController);

  final ScrollController scrollController;

  @override
  _CreateProjetoButtonState createState() => _CreateProjetoButtonState();
}

class _CreateProjetoButtonState extends State<CreateProjetoButton>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? buttonAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    buttonAnimation = Tween<double>(begin: 0, end: 66).animate(
      CurvedAnimation(
        parent: controller!,
        curve: const Interval(0.4, 0.6),
      ),
    );

    widget.scrollController.addListener(scrollChanged);
  }

  void scrollChanged() {
    final s = widget.scrollController.position;
    if (s.userScrollDirection == ScrollDirection.forward) {
      controller!.forward();
    } else {
      controller!.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: buttonAnimation!,
      builder: (_, __) {
        return FractionallySizedBox(
          widthFactor: 0.6,
          child: Container(
            height: 50,
            margin: EdgeInsets.only(
              bottom: buttonAnimation!.value,
            ),
            child: ReplaceRaisedButton(
              color: ColorsConst.secondary,
              disabledColor: ColorsConst.secondary.withAlpha(120),
              textColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      'Cadastrar',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              onPressed: () {
                Modular.to.pushNamed(
                    '${RouterConst.PROJECT_ROUTER}${RouterConst.ADD_PROJECT_ROUTER}');
              },
            ),
          ),
        );
      },
    );
  }
}
