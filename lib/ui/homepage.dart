import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool oTurn = true;
  List<String>displayXO = ['','','','','','','','','',];
  String result = '';
  int playerOScore = 0;
  int playerXScore = 0;
  int filedBox = 0;
  bool winnerFound = false;
  static const maxSeconds = 20;
  int second = maxSeconds;
  int attempt =0;

  Timer? timer;

  void startTimer(){
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        if(second >0){
          second--;
        }else{
          stopTimer();
        }
      });
    });
  }

  void stopTimer(){
    timer?.cancel();
    resetTimer();
  }

  void resetTimer()=>second = maxSeconds;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent.shade100,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [

            Expanded(flex:1,child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Player O',style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic
                            ),),
                            Text(playerOScore.toString(),style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic
                            ))
                          ],
                        ),
                        SizedBox(width: 20,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Player X',style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic
                            )),
                            Text(playerXScore.toString(),style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic
                            ))
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
            Expanded(flex:3,child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemBuilder: (BuildContext context,int index){
              return GestureDetector(
                onTap:(){
                  _ontap(index);
                } ,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      width: 5,
                      color: Colors.black
                    )
                  ),child: Center(child: Text(displayXO[index],style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold
                  ),)),),
                ),
              );
                })),
            Expanded(child:Column(
              children: [
                Text(result,style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic
                ),),
               SizedBox(
                 height: 16,
               ),
               _timershow()
              ],
            ),),
          ],
        ),
      ),
    );
  }
  void _ontap (int index){
    final isRunning = timer == null ? false : timer!.isActive;
    if(isRunning){
      setState(() {
        if(oTurn && displayXO[index] == ''){
          displayXO[index] = 'O';
          filedBox++;

        }else if(!oTurn && displayXO[index] == ''){
          displayXO[index] = 'X';
          filedBox++;
        }
      });
      oTurn = !oTurn;
      _winner();
    }
  }

  void _winner(){
    //row1
    if(displayXO[0] == displayXO[1] && displayXO[0] == displayXO[2] && displayXO[0]!=''){
      setState(() {
        result = 'Player ' + displayXO[0] + ' Wins!';
        _updateScore(displayXO[0]);
        winnerFound = true;
        stopTimer();
      });
    }
    //row2
    if(displayXO[3] == displayXO[4] && displayXO[3] == displayXO[5] && displayXO[3]!=''){
      setState(() {
        result = 'Player ' + displayXO[3] + ' Wins!';
        _updateScore(displayXO[3]);
        winnerFound = true;
        stopTimer();

      });
    }
    //row3
    if(displayXO[6] == displayXO[7] && displayXO[6] == displayXO[8] && displayXO[6]!=''){
      setState(() {
        result = 'Player ' + displayXO[6] + ' Wins!';
        _updateScore(displayXO[6]);
        winnerFound = true;
        stopTimer();
      });
    }
    //col1
    if(displayXO[0] == displayXO[3] && displayXO[0] == displayXO[6] && displayXO[0]!=''){
      setState(() {
        result = 'Player ' + displayXO[0] + ' Wins!';
        _updateScore(displayXO[0]);
        winnerFound = true;
        stopTimer();
      });
    }
    //col2
    if(displayXO[1] == displayXO[4] && displayXO[1] == displayXO[7] && displayXO[1]!=''){
      setState(() {
        result = 'Player ' + displayXO[1] + ' Wins!';
        _updateScore(displayXO[1]);
        winnerFound = true;
        stopTimer();
      });
    }
    //col13
    if(displayXO[2] == displayXO[5] && displayXO[2] == displayXO[8] && displayXO[2]!=''){
      setState(() {
        result = 'Player ' + displayXO[2] + ' Wins!';
        _updateScore(displayXO[2]);
        winnerFound = true;
        stopTimer();
      });
    }
    //digonal1
    if(displayXO[0] == displayXO[4] && displayXO[0] == displayXO[8] && displayXO[0]!=''){
      setState(() {
        result = 'Player ' + displayXO[0] + ' Wins!';
        _updateScore(displayXO[0]);
        winnerFound = true;
        stopTimer();
      });
    }
    //digonal2
    if(displayXO[2] == displayXO[4] && displayXO[2] == displayXO[6] && displayXO[2]!=''){
      setState(() {
        result = 'Player ' + displayXO[2] + ' Wins!';
        _updateScore(displayXO[2]);
        winnerFound = true;
        stopTimer();
      });
    }
    if(!winnerFound && filedBox == 8){
      result = 'Nobody wins :(';
      stopTimer();
    }

  }

  void _updateScore (String winner){
    setState(() {
      if(winner == 'O'){
        playerOScore++;
      }else if (winner == 'X'){
        playerXScore++;
      }
    });
  }

  void _clearBord(){
    setState(() {
      for(int i = 0; i<9;i++){
        displayXO[i]='';
      }
      result = '';
    });
    filedBox = 0;
  }

  Widget _timershow(){
    final isRunning = timer == null ? false : timer!.isActive;

    return isRunning ? SizedBox(
      width: 40,
      height: 40,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: 1-second/maxSeconds ,
            valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
            strokeWidth: 8,
            backgroundColor: Colors.black,
          ),
          Center(
            child: Text(
              '$second',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    ) :  ElevatedButton(onPressed: (){

      startTimer();
      _clearBord();
      attempt ++ ;
    }, child: attempt == 0 ? Text('Start') : Icon(Icons.restart_alt));
  }
}
