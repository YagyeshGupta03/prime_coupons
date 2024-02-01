import 'dart:math';
import 'package:clipeate_project/controllers/category_controller.dart';
import 'package:clipeate_project/controllers/common_controllers.dart';
import 'package:clipeate_project/screens/dashboard/filter_result_screen.dart';
import 'package:clipeate_project/widgets/constants.dart';
import 'package:clipeate_project/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../../generated/l10n.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  double _minValue = 25.0;
  double _maxValue = 75.0;
  String status = '';
  String minDis = '';
  String maxDis = '';
  String category = '';
  String sorting = '';

  final _min = TextEditingController();
  final _max = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppUi().primaryColor),
      body: SingleChildScrollView(
        child: Card(
          color: AppUi().filterClr,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(color: Colors.transparent),
          ),
          margin: const EdgeInsets.all(15),
          child: Container(
            width: screenWidth(context),
            padding: const EdgeInsets.all(15),
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      S.of(context).filter,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                 Text(
                  S.of(context).price,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                const SizedBox(height: 5),
                SfRangeSlider(
                  min: 0.0,
                  max: 2000.0,
                  activeColor: AppUi().primaryColor,
                  values: SfRangeValues(_minValue, _maxValue),
                  onChanged: (SfRangeValues values) {
                    setState(() {
                      _minValue = values.start;
                      _maxValue = values.end;
                      _min.text = _minValue.toStringAsFixed(0);
                      _max.text = _maxValue.toStringAsFixed(0);
                    });
                  },
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: CustomTextField(
                            cont: _min, hintText: S.of(context).min, enable: true, keyboard: TextInputType.number)),
                    const SizedBox(width: 10),
                    Expanded(
                        flex: 2,
                        child: CustomTextField(
                            cont: _max, hintText: S.of(context).max, enable: true, keyboard: TextInputType.number)),
                  ],
                ),
                const SizedBox(height: 20),
                 Text(
                  S.of(context).status,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField(
                  hint:  Text(
                    S.of(context).allDeals,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  dropdownColor: Colors.white,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      fillColor: Colors.white),
                  onChanged: (val) {
                    if(val == '2'){
                      status = '';
                    }else{
                      status = val.toString();
                    }
                    setState(() {});
                  },
                  items:  [
                    DropdownMenuItem(
                      value: '2',
                      child: Text(
                        S.of(context).allDeals,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    DropdownMenuItem(
                      value: '0',
                      child: Text(
                        S.of(context).instantDeals,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    DropdownMenuItem(
                      value: '1',
                      child: Text(
                        S.of(context).upcomingDeals,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                 Text(
                  S.of(context).discount,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField(
                  hint:  Text(
                    S.of(context).allDiscounts,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  dropdownColor: Colors.white,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      fillColor: Colors.white),
                  onChanged: (val) {
                    if (val.toString() == '1') {
                      minDis = '20';
                      maxDis = '49';
                    } else if (val.toString() == '2') {
                      minDis = '50';
                      maxDis = '79';
                    } else if (val.toString() == '3') {
                      minDis = '80';
                      maxDis = '100';
                    } else {
                      minDis = '';
                      maxDis = '';
                    }
                    setState(() {});
                  },
                  items:  [
                    DropdownMenuItem(
                      value: S.of(context).allDiscounts,
                      child: Text(
                        S.of(context).allDiscounts,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    DropdownMenuItem(
                      value: '1',
                      child: Text(
                          '20% ${S.of(context).off} - 49% ${S.of(context).off}',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    DropdownMenuItem(
                      value: '2',
                      child: Text(
                        '50% ${S.of(context).off} - 79% ${S.of(context).off}',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    DropdownMenuItem(
                      value: '3',
                      child: Text(
                        '80% ${S.of(context).offAndAbove}',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                 Text(
                  S.of(context).category,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                const SizedBox(height: 10),
                GetBuilder<CategoryController>(
                  initState: (_) {
                    Get.find<CategoryController>().getCategories();
                  },
                  builder: (CategoryController controller) {
                    return DropdownButtonFormField(
                      hint: Text(
                        S.of(context).allCategories,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      dropdownColor: Colors.white,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          fillColor: Colors.white),
                      onChanged: (val) {
                        category = val.toString();
                        setState(() {});
                      },
                      items: [
                         DropdownMenuItem(
                          value: S.of(context).allCategory,
                          child: Text(
                            S.of(context).allCategory,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ),
                        for (int index = 0;
                            index < controller.categoryList!.length;
                            index++)
                          DropdownMenuItem(
                            value: Intl.getCurrentLocale() == 'en'
                                ? controller.categoryList![index].englishText
                                    .toString()
                                : controller.categoryList![index].spanishText
                                    .toString(),
                            child: SizedBox(
                              width: screenWidth(context) / 1.5,
                              child: Text(
                                Intl.getCurrentLocale() == 'en'
                                    ? controller
                                        .categoryList![index].englishText
                                        .toString()
                                    : controller
                                        .categoryList![index].spanishText
                                        .toString(),
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 20),
                 Text(
                  S.of(context).sorting,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField(
                  hint:  Text(
                    S.of(context).defaultRank,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  dropdownColor: Colors.white,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      fillColor: Colors.white),
                  onChanged: (val) {
                    if(val == '0'){
                      sorting = '';
                    }else{
                      sorting = val.toString();
                    }
                    setState(() {});
                  },
                  items:  [
                    DropdownMenuItem(
                      value: '0',
                      child: Text(
                        S.of(context).defaultRank,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    DropdownMenuItem(
                      value: '1',
                      child: Text(
                        S.of(context).priceLowToHigh,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    DropdownMenuItem(
                      value: '2',
                      child: Text(
                        S.of(context).priceHighToLow,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    DropdownMenuItem(
                      value: '3',
                      child: Text(
                        S.of(context).discountHighToLow,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    DropdownMenuItem(
                      value: '4',
                      child: Text(
                        S.of(context).newest,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                GetBuilder<FilterController>(
                  builder: (FilterController controller) {
                    return CustomLongButton(
                        onTap: () {
                          controller.getFilteredResults(
                              _min.text,
                              _max.text,
                              status,
                              category,
                              sorting,
                              minDis,
                              maxDis,
                              '0',
                              '10', true, true, false);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FilterResultScreen(
                                  min: _min.text,
                                  max: _max.text,
                                  status: status,
                                  category: category,
                                  sorting: sorting,
                                  minDis: minDis,
                                  maxDis: maxDis),
                            ),
                          );
                        },
                        title: S.of(context).filter,
                        txtColor: Colors.white,
                        btnColor: AppUi().primaryColor,
                        prefix: false);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
