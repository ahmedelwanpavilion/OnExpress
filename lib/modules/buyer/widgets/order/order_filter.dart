import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:on_express/shared/styles/colors.dart';

class OrderFilter extends StatefulWidget {
  const OrderFilter({Key? key}) : super(key: key);

  @override
  State<OrderFilter> createState() => _OrderFilterState();
}

class _OrderFilterState extends State<OrderFilter> {

  String? filter;

  bool isOpen = false;
  bool showList = false;

  List<String> filters = [
    'canceled',
    'up_coming',
    'completed',
  ];


  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: 161,
      height: isOpen?150:46,//150,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(10),
        border: Border.all(color: defaultColor)
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              if(isOpen){
                isOpen = !isOpen;
                showList = !showList;
                setState(() {});
              }else{
                isOpen = !isOpen;
                setState(() {});
                Future.delayed(Duration(milliseconds: 200),(){
                  showList = !showList;
                  setState(() {});
                });
              }
            },
            child: Row(
              children: [
                Expanded(
                    child:ConditionalBuilder(
                      condition: filter!=null,
                      fallback: (c)=>Text(tr('filter'),style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                      builder: (c)=>Text(filter!,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                    )
                ),
                Icon(Icons.arrow_drop_down,color: defaultColor,)
              ],
            ),
          ),
          if(showList)
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: ListView.separated(
                itemBuilder: (c,i)=>InkWell(
                  onTap: (){
                    setState(() {
                      filter = filters[i];
                    });
                    if(isOpen){
                      isOpen = !isOpen;
                      showList = !showList;
                      setState(() {});
                    }else{
                      isOpen = !isOpen;
                      setState(() {});
                      Future.delayed(Duration(milliseconds: 200),(){
                        showList = !showList;
                        setState(() {});
                      });
                    }
                  },
                    child: Text(tr(filters[i]),style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),)),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                separatorBuilder: (c,i)=>const SizedBox(height: 0,),
                itemCount: filters.length
            ),
          )
        ],
      ),
    );
  }
}
