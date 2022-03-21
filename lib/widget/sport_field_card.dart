import 'package:flutter/material.dart';

import '../model/sport_field.dart';
import '../screen/detail_screen.dart';
import '../theme.dart';

class SportFieldCard extends StatelessWidget {
  SportField field;

  SportFieldCard({required this.field});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return DetailScreen(field: field,);
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 4.0, bottom: 16.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0), color: colorWhite),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius:
                BorderRadius.vertical(top: Radius.circular(borderRadiusSize)),
                child: Image.asset(field.imageAsset,
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      field.name,
                      maxLines: 2,
                      style: subTitleTextStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "assets/icons/pin.png",
                          width: 20,
                          height: 20,
                          color: primaryColor500,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Flexible(
                          child: Text(
                            field.address,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: addressTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
