import 'package:flutter/services.dart';
//import 'package:intl/date_symbol_data_local.dart';
// used strings instead of datetime as you can do it while getting date m using temp values so modify ur logic accordingly
class TransactionHistory{
  int transactionType;  //0 for debit 1 for credit
  bool expiredTransaction; //if expire true else false
  String expiredDate; //for debit and expired use this date
  String expiresOnDate; //for credit use this date to
  String transactionDate; //date on which debited or credited
  String transactionDetails;
  int amount;

  // below parameter are used to send data in a string format to save the trouble of doing manipulation at ui side
  String expiryDisplayDetail;
  String transactionDisplayDate;
  String amountDisplay;

  TransactionHistory(
      this.transactionType,
      this.expiredTransaction,
      this.expiredDate,
      this.expiresOnDate,
      this.transactionDate,
      this.transactionDetails,
      this.amount);

  static List<TransactionHistory> transactionHistory=[
    TransactionHistory(0,true,"18-May-2020","17-May-2020","18-May-2020","Expired",50),
    TransactionHistory(1,false,"","17-May-2020","14-May-2020","Promo #E0063 issued",50),
    TransactionHistory(0,true,"10-May-2020","10-May-2020","11-May-2020","Expired",50),
    TransactionHistory(1,false,"","10-May-2020","08-May-2020","Promo #E0062 issued",50),
    TransactionHistory(0,true,"03-May-2020","03-May-2020","04-May-2020","Expired",50),
    //TransactionHistory(1,false,"","31-April-2020","01-April-2020","Promo #E0062 issued",50),
  ];

  static List<TransactionHistory> getTransactionHistory()
  {
    List<TransactionHistory> lstTransactionHistoryData=new List<TransactionHistory>();
    for(TransactionHistory tHistory in transactionHistory)
      {
        List<String> lstExpiredDate=new List<String>();
        List<String> lstExpiresOnDate=new List<String>();
        List<String> lstTransactionDate=tHistory.transactionDate.split('-');
        if(tHistory.transactionType==0)
          {
            tHistory.amountDisplay="-"+tHistory.amount.toString();
          }
        else
          {
            tHistory.amountDisplay="+"+tHistory.amount.toString();
          }
        if(tHistory.expiredTransaction)
          {
            lstExpiredDate=tHistory.expiredDate.split('-');
            tHistory.expiryDisplayDetail="On "+lstExpiredDate[1]+" "+lstExpiredDate[0]+", "+lstExpiredDate[2];
          }
        else
          {
            lstExpiresOnDate=tHistory.expiresOnDate.split('-');
            tHistory.expiryDisplayDetail="Expires on "+lstExpiresOnDate[0]+" "+lstExpiresOnDate[1]+" "+lstExpiresOnDate[2];
          }
        tHistory.transactionDisplayDate=lstTransactionDate[0]+" "+lstTransactionDate[1];
        lstTransactionHistoryData.add(tHistory);
      }
    return lstTransactionHistoryData;
  }
}