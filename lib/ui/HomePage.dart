import 'package:cure_fit/Model/TransactionHistory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:Center(
          child: FlatButton.icon(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => FitCash(userid :"Tanv6004"),)), icon: Icon(Icons.account_balance_wallet), label: Text("FitCash")),
        )
      ),
    );
  }
}

class FitCash extends StatefulWidget {
  final String userid;
  const FitCash({Key key, this.userid}) : super(key: key);
  @override
  _FitCashState createState() => _FitCashState();
}

class _FitCashState extends State<FitCash> {
  List<TransactionHistory> tHistory=TransactionHistory.getTransactionHistory();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        titleSpacing: -5,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: IconTheme(
            data:new IconThemeData(
                color:Colors.red.shade900
            ),
            child: Icon(Icons.arrow_back_ios),
          ),
          onPressed: null,
        ),
        title: Text("Fitcash",style: TextStyle(
          color:Colors.black,
          fontWeight: FontWeight.bold
        ),),
        actions: <Widget>[
          IconButton(icon: IconTheme(
            data:new IconThemeData(
              color:Colors.red.shade900,
            ),
            child: Icon(Icons.info_outline),
          ),
            onPressed: null,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height/4,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Total Balance".toUpperCase()),
                SizedBox(height: 10,),
                Text("0",style: TextStyle(
                  color: Colors.blueGrey.shade900,
                  fontSize: 40
                ),),
                SizedBox(height: 10,),
                Text("1 Fitcash = \u20B91",style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15
                ),)
              ],
            ),

          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [Colors.white,Colors.blueGrey.shade50],
            )
          ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 2,
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:20,left:20,right:20),
            child: Container(
              child: Text("TRANSACTION HISTORY",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
            ),
          ),
//          ListView.builder(
//              itemBuilder: null
//          )
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top:20,left:20,right:20),
                child: ListView.builder(
                    shrinkWrap:true,
                    physics: ScrollPhysics(),
                    itemCount: tHistory.length,
                    itemBuilder: (context,index)=> TransactionHistoryRecords(transrecord: tHistory[index],)
                ),
              ),
            )
        ],
      ),
    );
  }
}

class TransactionHistoryRecords extends StatelessWidget {
  final TransactionHistory transrecord;
  const TransactionHistoryRecords({Key key, this.transrecord}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment:MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: IconTheme(
                    child: Icon(Icons.account_balance_wallet),
                    data: IconThemeData(
                      size: 30,
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: Text(transrecord.transactionDetails,style: TextStyle(
                            fontSize: 16
                        ),),
                      ),
                      Text(transrecord.expiryDisplayDetail,style: TextStyle(
                          fontSize: 13
                      ),)
                    ],
                  ),
                ),
                Expanded(
                  flex:3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: Text(transrecord.amountDisplay,style: TextStyle(
                            color: transrecord.transactionType==0?Colors.red.shade900:Colors.green.shade900,
                            fontSize: 19,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                      Text(transrecord.transactionDisplayDate,style: TextStyle(
                          fontSize: 13
                      ),)
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: 2,
              decoration: BoxDecoration(
                color: Colors.grey,
              )
          )
        ],
      ),
    );
  }
}
