import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridPage extends StatefulWidget {
  const GridPage({super.key});

  @override
  State<GridPage> createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  List<String> board = List.generate(9, (index) => "");
  bool xPlayerTurn = true;
  String value = "X";
  bool gameOver = false;

  int xScore = 0;
  int oScore = 0;

  void onContainerTap(int index) {
    if (gameOver) return;

    setState(() {
      if (xPlayerTurn && board[index] == "") {
        board[index] = "X";
      } else if (!xPlayerTurn && board[index] == "") {
        board[index] = "O";
      }

      winner();

      if (!gameOver) {
        xPlayerTurn = !xPlayerTurn;
        value = xPlayerTurn ? "X" : "O";
      }
    });
  }

  void winner() {
    if (board[0] == board[1] && board[1] == board[2] && board[0] != "") {
      gameOver = true;
      gameOver = true;

      board[0] == "X" ? xScore++ : oScore++;

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(content: Text("${board[0]} wins"));
        },
      );
    } else if (board[3] == board[4] && board[4] == board[5] && board[3] != "") {
      gameOver = true;
      gameOver = true;

      board[3] == "X" ? xScore++ : oScore++;

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(content: Text("${board[3]} wins"));
        },
      );
    } else if (board[6] == board[7] && board[7] == board[8] && board[6] != "") {
      gameOver = true;
      gameOver = true;

      board[6] == "X" ? xScore++ : oScore++;

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(content: Text("${board[6]} wins"));
        },
      );
    } else if (board[0] == board[3] && board[3] == board[6] && board[0] != "") {
      gameOver = true;
      gameOver = true;

      board[0] == "X" ? xScore++ : oScore++;

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(content: Text("${board[0]} wins"));
        },
      );
    } else if (board[1] == board[4] && board[4] == board[7] && board[1] != "") {
      gameOver = true;
      gameOver = true;

      board[1] == "X" ? xScore++ : oScore++;

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(content: Text("${board[1]} wins"));
        },
      );
    } else if (board[2] == board[5] && board[5] == board[8] && board[2] != "") {
      gameOver = true;
      gameOver = true;

      board[2] == "X" ? xScore++ : oScore++;

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(content: Text("${board[2]} wins"));
        },
      );
    } else if (board[0] == board[4] && board[4] == board[8] && board[0] != "") {
      gameOver = true;
      gameOver = true;

      board[0] == "X" ? xScore++ : oScore++;

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(content: Text("${board[0]} wins"));
        },
      );
    } else if (board[2] == board[4] && board[4] == board[6] && board[2] != "") {
      gameOver = true;
      gameOver = true;

      board[2] == "X" ? xScore++ : oScore++;

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(content: Text("${board[2]} wins"));
        },
      );
    } else if (!board.contains("")) {
      gameOver = true;

      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(content: Text("Game Over: Draw"));
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final boardSize = screenWidth > 600 ? 500.0 : screenWidth * 0.9;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          "Tic Tac Toe",
          style: GoogleFonts.orbitron(fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: boardSize,
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 20,
                ),
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xff2E3192), Color(0xff1BFFFF)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(179, 56, 56, 56),
                      blurRadius: 18,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "PLAYER X",
                          style: GoogleFonts.orbitron(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            color: Colors.white24,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            "$xScore",
                            style: GoogleFonts.pressStart2p(
                              fontSize: 20,
                              color: Colors.amber,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        Icon(Icons.emoji_events, color: Colors.amber, size: 40),
                        const SizedBox(height: 8),
                        Text(
                          "SCORE",
                          style: GoogleFonts.orbitron(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        Text(
                          "PLAYER O",
                          style: GoogleFonts.orbitron(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            color: Colors.white24,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            "$oScore",
                            style: GoogleFonts.pressStart2p(
                              fontSize: 20,
                              color: Colors.amber,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                "PLAYER $value'S TURN",
                style: GoogleFonts.pressStart2p(
                  fontSize: 16,
                  color: Colors.indigo,
                ),
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: boardSize,
                height: boardSize,
                child: GridView.builder(
                  itemCount: board.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        onContainerTap(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.08),
                              blurRadius: 5,
                              offset: const Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            board[index],
                            style: GoogleFonts.orbitron(
                              fontSize: 40,
                              color: Colors.indigo,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: 180,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      board = List.generate(9, (index) {
                        // gameOver = false;
                        onContainerTap(index);
                        print('restarted');
                        return "";
                      });
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    elevation: 10,
                    shadowColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    "Restart Game",
                    style: GoogleFonts.orbitron(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
