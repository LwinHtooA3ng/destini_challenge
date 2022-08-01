import 'package:flutter/material.dart';
import 'story_brain.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  String myStory = "";

  void getStory() {
    setState(() {
      myStory = storyBrain.getStory();
    });
  }

  @override
  void initState() {
    getStory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //       image: AssetImage("images/background.png"), fit: BoxFit.cover),
        // ),
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "Destini",
                  style: GoogleFonts.breeSerif(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: Text(myStory,
                          // style: const TextStyle(
                          //   fontSize: 15.0,

                          // ),
                          style: GoogleFonts.uchen(
                            fontSize: 15.0,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 50,
                  child: FlatButton(
                    onPressed: () {
                      storyBrain.nextStory(1);
                      getStory();
                    },
                    color: Colors.amber,
                    child: Text(storyBrain.getChoice1(),
                        // 'Choice 1',
                        style: GoogleFonts.breeSerif(
                          fontSize: 15,
                        )
                        // style: const TextStyle(
                        //   fontSize: 15.0,
                        // ),
                        ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Container(
                  height: 50,
                  child: Visibility(
                    visible: storyBrain.buttonShouldBeVisible(),
                    child: FlatButton(
                      onPressed: () {
                        storyBrain.nextStory(2);
                        getStory();
                      },
                      color: Colors.green,
                      child: Text(
                        storyBrain.getChoice2(),
                        style: GoogleFonts.breeSerif(
                          fontSize: 15,
                        ),
                        // style: const TextStyle(
                        //   fontSize: 15.0,
                        // ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
