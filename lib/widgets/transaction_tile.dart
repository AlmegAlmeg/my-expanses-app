import 'package:flutter/material.dart';
import 'package:myexpenessapp/config/colors.dart';
import 'package:myexpenessapp/config/font_sizes.dart';
import 'package:myexpenessapp/model/transaction.dart';
import 'package:myexpenessapp/utils/format_number.dart';
import 'package:myexpenessapp/widgets/customs/custom_text.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({required this.transaction, super.key});

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          backgroundColor: transaction.isExpanse ? keyColor2 : keyColor1,
          child: Icon(
            transaction.isExpanse ? Icons.attach_money : Icons.money_off,
            color: white,
          ),
        ),
        title: CustomText(text: transaction.name),
        subtitle: CustomText(
          text: '₪${formatNumber(transaction.amount)}',
          color: grey,
          fontSize: FontSizes.text18,
        ),
        // trailing: IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        trailing: PopupMenuButton(
          itemBuilder: (context) {
            return [
              PopupMenuItem(child: CustomText(text: "עריכה")),
              PopupMenuItem(child: CustomText(text: "מחיקה")),
            ];
          },
        ),
      ),
    );
  }
}
