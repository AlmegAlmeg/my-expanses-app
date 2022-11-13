// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:myexpenessapp/config/colors.dart';
// import 'package:myexpenessapp/config/font_sizes.dart';
// import 'package:myexpenessapp/config/media_query_variables.dart';
// import 'package:myexpenessapp/controllers/expanse_controller.dart';
// import 'package:myexpenessapp/widgets/customs/custom_button.dart';
// import 'package:myexpenessapp/widgets/customs/custom_text.dart';

// class AddInfoDialog extends StatefulWidget {
//   const AddInfoDialog({super.key});

//   @override
//   State<AddInfoDialog> createState() => _AddInfoDialogState();
// }

// class _AddInfoDialogState extends State<AddInfoDialog> {
//   bool _isExpanse = true;
//   final TextEditingController _infoController = TextEditingController();
//   final TextEditingController _priceController = TextEditingController();
//   final ExpanseController ec = Get.put(ExpanseController());

//   @override
//   void dispose() {
//     _infoController.dispose();
//     _priceController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Container(
//         height: height(context) * 0.7,
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//         decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(20)),
//         child: Form(
//           child: Column(
//             children: [
//               const CustomText(text: "הוספת הוצאה / הכנסה", fontSize: FontSizes.text32),
//               const SizedBox(height: 10),
//               TextFormField(
//                 controller: _infoController,
//                 keyboardType: TextInputType.text,
//                 decoration: const InputDecoration(label: CustomText(text: "תיאור")),
//               ),
//               const SizedBox(height: 10),
//               TextFormField(
//                 controller: _priceController,
//                 keyboardType: TextInputType.number,
//                 decoration: const InputDecoration(label: CustomText(text: "סכום")),
//               ),
//               const SizedBox(height: 30),
//               CustomButton(
//                 backgroundColor: primary,
//                 func: () {
//                   if (_isExpanse) {
//                     ec.addExpanse(_infoController.text, double.parse(_priceController.text));
//                   } else {
//                     ec.addIncome(_infoController.text, double.parse(_priceController.text));
//                   }
//                   Get.back();
//                 },
//                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//                 child: const CustomText(
//                   text: "הוספה",
//                   color: white,
//                   fontSize: FontSizes.text32,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
