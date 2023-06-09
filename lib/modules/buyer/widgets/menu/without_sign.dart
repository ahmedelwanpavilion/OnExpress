import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:on_express/splash_screen.dart';

import '../../../../shared/components/components.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/images/images.dart';
import '../../menu/menu_screens/about_us_screen.dart';
import '../../menu/menu_screens/contact_screen.dart';
import '../../menu/menu_screens/settings_screen.dart';
import '../../menu/menu_screens/terms_screen.dart';

class WithoutSign extends StatelessWidget {
  const WithoutSign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            height: 190,width: 190,
            decoration: BoxDecoration(
                color: HexColor('#F7F7F7'),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 15,
                      color: Colors.grey.shade300
                  )
                ],
                shape: BoxShape.circle
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset(Images.person,width: 74,height: 83,),
          ),
        ),
        const SizedBox(height: 15,),
        itemBuilder(
            onTap: (){
              navigateTo(context, SettingsScreen());
            },
            title: 'settings',
            icon: Images.settings
        ),
        itemBuilder(
            onTap: (){
              navigateTo(context, ContactScreen());
            },
            title: 'help',
            icon: Images.help
        ),
        itemBuilder(
            onTap: (){
              navigateTo(context, AboutUsScreen());
            },
            title: 'about',
            icon: Images.aboutUs
        ),
        itemBuilder(
            onTap: (){
              navigateTo(context, TermsScreen());
            },
            title: 'terms',
            icon: Images.terms
        ),
        itemBuilder(
            onTap: (){
              navigateAndFinish(context, SplashScreen());
            },
            title: 'login',
            icon: Images.log
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0,bottom: 10),
          child: Text.rich(
              TextSpan(
                  text: '${tr('version')} ',
                  style: TextStyle(fontSize: 13),
                  children: [
                    TextSpan(
                        text: version,
                        style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700)
                    )
                  ]
              )
          ),
        ),
        InkWell(
            onTap: ()=>openUrl('https://pavilion-teck.com/'),
            child: Image.asset(Images.pavilion,width: 87,height: 20,)),
      ],
    );
  }

  Widget itemBuilder({
    required VoidCallback onTap,
    required String icon,
    required String title,
  }){
    return TextButton(
      onPressed: onTap,
      child: Row(
        children: [
          Image.asset(icon,width: 20,),
          const SizedBox(width: 15,),
          Text(
            tr(title),
            style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
