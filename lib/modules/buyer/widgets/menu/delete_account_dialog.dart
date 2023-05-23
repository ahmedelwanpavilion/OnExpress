import 'package:flutter/material.dart';
import 'package:on_express/layout/buyer/buyer_layout.dart';
import 'package:on_express/shared/components/components.dart';
import 'package:on_express/shared/images/images.dart';
import 'package:on_express/splash_screen.dart';
import 'package:on_express/widgets/default_button.dart';

import '../../../../shared/styles/colors.dart';

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({Key? key}) : super(key: key);

  //Successful Bookings You Will Be Notified Soon

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: defaultColor,),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.only(topEnd: Radius.circular(200)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100,left: 30,right: 30,bottom: 30),
          child: Column(
            children: [
              Image.asset(Images.deleteAccountDialog,width: 233,),
              const SizedBox(height: 60,),
              DefaultButton(
                  text: 'Delete Now',
                  onTap: (){
                    Navigator.pop(context);
                    navigateAndFinish(context, SplashScreen());
                  }
              ),
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: defaultColor),
                  )
              )
            ],
          ),
        ),
      ],
    );
  }
}
