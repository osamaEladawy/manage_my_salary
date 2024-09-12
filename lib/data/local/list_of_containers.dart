import 'package:expense_management/core/classes/service.dart';
import 'package:expense_management/core/constant/style.dart';
import 'package:expense_management/data/local/custom_containers.dart';
import 'package:flutter/material.dart';

List<Widget> containersHome = [
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Text(
          "حساب تحويل العملات الي الدولار",
          style: titleContainer,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage("assets/images/dolar.png"),
      )
    ],
  ),
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "عرض الاقساط ومواعيدها",
        style: titleContainer,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
      CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage(
          "assets/images/aqsat.jpg",
        ),
      ),
    ],
  ),
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Text(
          "تنظيم المصروفات بالنسبه لدخلك الشهري",
          style: titleContainer,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage(
          "assets/images/masrouf.png",
        ),
      ),
    ],
  ),
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "البيانات الشخصيه",
        style: titleContainer,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
      CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage("assets/images/data.jpg"),
      )
    ],
  ),
];

List<Widget> containersBalance = [
  CustomContainer("مصروفاتك الاساسيه الثابته", 0.5,
      Services.getData(key: 'monthlySalary'), [
    Row(
      children: [
        Expanded(
            child: Image.asset('assets/images/l1.png', width: 20, height: 20)),
        const SizedBox(width: 7),
        Text("فواتير الكهربا والمياه", style: subTitleContainer),
      ],
    ),
    Row(
      children: [
        Image.asset('assets/images/l2.png', height: 20, width: 20),
        const SizedBox(width: 7),
        Text(
          "مصاريف التعليم",
          style: subTitleContainer,
        ),
      ],
    ),
    Row(
      children: [
        Image.asset('assets/images/l3.png', width: 20, height: 20),
        const SizedBox(width: 7),
        Text(
          "الرعايه الصحيه",
          style: subTitleContainer,
        ),
      ],
    ),
    Row(
      children: [
        Image.asset('assets/images/l4.png', height: 20, width: 20),
        const SizedBox(width: 7),
        Text(
          "النقل",
          style: subTitleContainer,
        ),
      ],
    ),
    Row(
      children: [
        Image.asset('assets/images/l44.png', height: 20, width: 20),
        const SizedBox(width: 7),
        Text(
          "الاتصالات",
          style: subTitleContainer,
        ),
      ],
    ),
  ]),
  CustomContainer('المصروفات الشخصيه المتغيره', 0.3,
      Services.getData(key: 'monthlySalary'), [
    Row(
      children: [
        Image.asset('assets/images/l4.png', height: 20, width: 20),
        const SizedBox(width: 7),
        Text(
          " التسوق",
          style: subTitleContainer,
        ),
      ],
    ),
    Row(
      children: [
        Image.asset('assets/images/l5.png', height: 20, width: 20),
        const SizedBox(width: 7),
        Text(
          " الانشطه الترفيهيه",
          style: subTitleContainer,
        ),
      ],
    ),
    Row(
      children: [
        Image.asset('assets/images/l7.png', height: 20, width: 20),
        const SizedBox(width: 7),
        Text(
          " الرحلات",
          style: subTitleContainer,
        ),
      ],
    ),
    Row(
      children: [
        Image.asset('assets/images/l8.png', height: 20, width: 20),
        const SizedBox(width: 7),
        Text(
          "الهدايا",
          style: subTitleContainer,
        ),
      ],
    ),
  ]),
  CustomContainer(
      'الادخارات والاستثمارات', 0.2, Services.getData(key: 'monthlySalary'), [
    Row(
      children: [
        Image.asset('assets/images/l9.png', height: 20, width: 20),
        const SizedBox(width: 7),
        Text(
          " زيادة المدخرات",
          style: subTitleContainer,
        ),
      ],
    ),
    Row(
      children: [
        Image.asset('assets/images/type.jpg', height: 20, width: 20),
        const SizedBox(width: 7),
        Text(
          "تعجيل سداد الديون",
          style: subTitleContainer,
        ),
      ],
    ),
    Row(
      children: [
        Image.asset('assets/images/l10.png', height: 20, width: 20),
        const SizedBox(width: 7),
        Text(
          " حالات الطوارئ",
          style: subTitleContainer,
        ),
      ],
    ),
  ]),
];
