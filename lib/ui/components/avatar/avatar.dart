import 'package:flutter/material.dart';
import 'package:talk/ui/components/avatar/avatar_viewmodel.dart';
import 'package:provider/src/provider.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AvatarViewModel>();
    return ValueListenableBuilder(
      valueListenable: vm.photoURL,
      builder: (context, value, child){
        return Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(vm.photoURL.value),
                  fit: BoxFit.cover
              )
          ),
        );
      },
    );
  }
}
