import 'package:flutter/material.dart';
import 'package:haptic_fone/cardstockhome/cardsaleitem.dart';
import 'package:haptic_fone/database/db_stockitems.dart';
import 'package:haptic_fone/alertitems/alert_dashboraddelet.dart';
import 'package:haptic_fone/saleinvoice/inovice.dart';

class SalesListWidget extends StatelessWidget {
  final List<Saleitems> salesList;
  final Function(int) onDelete;
  final Function(int) onEdit;
  final Function fetchitems;
  const SalesListWidget(
      {super.key,
      required this.salesList,
      required this.onDelete,
      required this.onEdit,
      required this.fetchitems});

  @override
  Widget build(BuildContext context) {
    return salesList.isEmpty
        ? const Center(
            child: Text(
            "No Sales Available",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ))
        : ListView.builder(
            itemCount: salesList.length,
            itemBuilder: (context, index) {
              final sale = salesList[index];
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => InvoiceSaleDetails(
                            invoiceno: sale.invoiceno,
                            color: sale.saleHiveColor,
                            condtion: sale.saleHiveCondtion,
                            stroage: sale.saleHiveStroage,
                            imgpath: sale.saleimgpath,
                            saledate: sale.saledate,
                            emplylename: sale.empolye,
                            phonenumber: sale.phonenumber,
                            saleitem: sale.saleHivemodel,
                            itemcount: sale.saleHiveitemcount,
                            totalAmount: sale.saleHiveprice,
                          )));
                },
                child: CardSaledashborad(
                  sale: sale,
                  ondltsale: () {
                    dltaalert_Dashborad(context, index, salesList, fetchitems);
                  },
                ),
              );
            },
          );
  }
}
