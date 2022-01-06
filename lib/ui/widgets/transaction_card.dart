import 'package:bwa_airplane/models/transaction_model.dart';
import 'package:bwa_airplane/shared/theme.dart';
import 'package:bwa_airplane/ui/widgets/booking_details_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatefulWidget {

  final TransactionModel transaction;
  
  const TransactionCard(this.transaction, { Key? key }) : super(key: key);

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
          color: kWhiteColor, borderRadius: BorderRadius.circular(18)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Destination Tile
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                        image: NetworkImage(
                            widget.transaction.destination.imageUrl),
                        fit: BoxFit.cover)),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.transaction.destination.name,
                      style: blackTextStyle.copyWith(
                          fontSize: 18, fontWeight: medium),
                    ),
                    SizedBox(height: 5),
                    Text(
                      widget.transaction.destination.city,
                      style: greyTextStyle.copyWith(fontWeight: light),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    margin: EdgeInsets.only(right: 2),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/icons/star.png'))),
                  ),
                  Text(
                    widget.transaction.destination.rating.toString(),
                    style: blackTextStyle.copyWith(fontWeight: medium),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          //Booking Details Text
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              'Booking Details',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
          ),
          //Booking Details Item
          BookingDetailsItem(
            title: 'Traveler',
            valueText: '${widget.transaction.amountOfTraveler} person',
            valueColor: kBlackColor,
          ),
          BookingDetailsItem(
            title: 'Seat',
            valueText: widget.transaction.selectedSeats,
            valueColor: kBlackColor,
          ),
          BookingDetailsItem(
              title: 'Insurance',
              valueText: widget.transaction.insurance ? 'YES' : 'NO',
              valueColor:
                  widget.transaction.insurance ? kGreenColor : kRedColor),
          BookingDetailsItem(
              title: 'Refundable',
              valueText: widget.transaction.refundable ? 'YES' : 'NO',
              valueColor:
                  widget.transaction.refundable ? kGreenColor : kRedColor),
          BookingDetailsItem(
            title: 'VAT',
            valueText: '${(widget.transaction.vat * 100).toStringAsFixed(0)}%',
            valueColor: kBlackColor,
          ),
          BookingDetailsItem(
            title: 'Price',
            valueText: NumberFormat.currency(
                    locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                .format(widget.transaction.price),
            valueColor: kBlackColor,
          ),
          BookingDetailsItem(
            title: 'Grand Total',
            valueText: NumberFormat.currency(
                    locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                .format(widget.transaction.grandTotal),
            valueColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}