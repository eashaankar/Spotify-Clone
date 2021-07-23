// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Icon icon;
  final String title;
  final Function ontap;
  final Color colorbegin;
  final Color colorend;
   CustomCard({
    Key key,
    this.icon,
    this.title,
    this.ontap,
     this.colorbegin,
     this.colorend
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            //padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              //color: colorTheme.surface,
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  colorbegin,
                  colorend
                ]
              ),
              borderRadius: BorderRadius.circular(13),
              boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 17),
                    blurRadius: 17,
                    spreadRadius: -23,
                    color: Colors.black,
                  ),
                ],
            ),
            child: InkWell(
                onTap: () => ontap(),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          icon,
                          //Spacer(),
                          Text(
                            title,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(fontSize: 15, color: colorTheme.onPrimary, fontWeight: FontWeight.bold),
                          )
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
