import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tts/flutter_tts.dart';

var rng = new Random();

var story1 = "An Ox came down to a reedy pool to drink. As he splashed heavily into the water, he crushed a young Frog into the mud. The old Frog soon missed the little one and asked his brothers and sisters what had become of him. \"A great big monster,\" said one of them, \"stepped on little brother with one of his huge feet!" "Big, was he!\" said the old Frog, puffing herself up. \"Was he as big as this?" "Oh, much bigger!\" they cried. The Frog puffed up still more. \"He could not have been bigger than this,\" she said. But the little Frogs all declared that the monster was much, much bigger and the old Frog kept puffing herself out more and more until, all at once, she burst. Do not attempt the impossible.";
var story2 = "The Mice once called a meeting to decide on a plan to free themselves of their enemy, the Cat. At least they wished to find some way of knowing when she was coming, so they might have time to run away. Indeed, something had to be done, for they lived in such constant fear of her claws that they hardly dared stir from their dens by night or day. Many plans were discussed, but none of them was thought good enough. At last a very young Mouse got up and said: \"I have a plan that seems very simple, but I know it will be successful. All we have to do is to hang a bell about the Cat's neck. When we hear the bell ringing we will know immediately that our enemy is coming.\" All the Mice were much surprised that they had not thought of such a plan before. But in the midst of the rejoicing over their good fortune, an old Mouse arose and said: \"I will say that the plan of the young Mouse is very good. But let me ask one question: Who will bell the Cat?\" It is one thing to say that something should be done, but quite a different matter to do it.";
var story3 = "A Town Mouse once visited a relative who lived in the country. For lunch the Country Mouse served wheat stalks, roots, and acorns, with a dash of cold water for drink. The Town Mouse ate very sparingly, nibbling a little of this and a little of that, and by her manner making it very plain that she ate the simple food only to be polite. After the meal the friends had a long talk, or rather the Town Mouse talked about her life in the city while the Country Mouse listened. They then went to bed in a cozy nest in the hedgerow and slept in quiet and comfort until morning. In her sleep the Country Mouse dreamed she was a Town Mouse with all the luxuries and delights of city life that her friend had described for her. So the next day when the Town Mouse asked the Country Mouse to go home with her to the city, she gladly said yes. When they reached the mansion in which the Town Mouse lived, they found on the table in the dining room the leavings of a very fine banquet. There were sweetmeats and jellies, pastries, delicious cheeses, indeed, the most tempting foods that a Mouse can imagine. But just as the Country Mouse was about to nibble a dainty bit of pastry, she heard a Cat mew loudly and scratch at the door. In great fear the Mice scurried to a hiding place, where they lay quite still for a long time, hardly daring to breathe. When at last they ventured back to the feast, the door opened suddenly and in came the servants to clear the table, followed by the House Dog. The Country Mouse stopped in the Town Mouse's den only long enough to pick up her carpet bag and umbrella. \"You may have luxuries and dainties that I have not,\" she said as she hurried away, \"but I prefer my plain food and simple life in the country with the peace and security that go with it.\" Poverty with security is better than plenty in the midst of fear and uncertainty.";
var story4 = "A Fox one day spied a beautiful bunch of ripe grapes hanging from a vine trained along the branches of a tree. The grapes seemed ready to burst with juice, and the Fox's mouth watered as he gazed longingly at them. The bunch hung from a high branch, and the Fox had to jump for it. The first time he jumped he missed it by a long way. So he walked off a short distance and took a running leap at it, only to fall short once more. Again and again he tried, but in vain. Now he sat down and looked at the grapes in disgust. \"What a fool I am,\" he said. \"Here I am wearing myself out to get a bunch of sour grapes that are not worth gaping for.\" And off he walked very, very scornfully. There are many who pretend to despise and belittle that which is beyond their reach.";

FlutterTts flutterTts = new FlutterTts();

void stop() async {
  await flutterTts.stop();
}
void speak({String? text}) async {
  await flutterTts.setLanguage("en-US");
  // await flutterTts.setVolume(1.0);

  try {
    await flutterTts.speak(text!);
  } catch (e) {
    debugPrint(e.toString());
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Futura'),
        home: Home()
    );
  }
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: const Color(0xFF37323E),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Container(
                child: const Text("Start Listening ", style: TextStyle(color: Color(0xFFE0DDCF), fontSize: 36))
              ),
              new Center(
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const StoryManager())
                    );
                  },
                  icon: Image.asset("lib/Icons/HEX.png"),
                  iconSize: 200,
                  color: Colors.white,
                )
            ),
            ]
        )
    );
  }
}

class StoryManager extends StatefulWidget {
  const StoryManager({Key? key}) : super(key: key);

  @override
  State<StoryManager> createState() => _StoryManagerState();
}
class _StoryManagerState extends State<StoryManager> {
  int count = rng.nextInt(4).toInt();
  @override
  Widget build(BuildContext context) {
    if(count == 0) {
      speak(text: story1);
      return Story1();
    } else if(count == 1) {
      speak(text: story2);
      return Story2();
    } else if(count == 2) {
      speak(text: story3);
      return Story3();
    } else
      speak(text: story4);
      return Story4();
  }
}

class Story1 extends StatefulWidget {
  const Story1({Key? key}) : super(key: key);

  @override
  State<Story1> createState() => _Story1State();
}
class _Story1State extends State<Story1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("The Frogs & the Ox", style: TextStyle(fontSize: 28)),
        backgroundColor: const Color(0xFF20BF55),
        bottom: PreferredSize(
            child: Container(
              color: Color(0xFF37323E),
              height: 4.0,
            ),
            preferredSize: Size.fromHeight(24.0)),
      ),
      body: Page1_1(),
        backgroundColor: Color(0xFFE0DDCF),
    );
  }
}
class Page1_1 extends StatefulWidget {
  const Page1_1({Key? key}) : super(key: key);

  @override
  State<Page1_1> createState() => _Page1_1State();
}
class _Page1_1State extends State<Page1_1> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.all(50),
          child: Text(story1,
              style: TextStyle(color: Colors.black, fontSize: 20))
      ),
    );
  }
}


class Story2 extends StatefulWidget {
  const Story2({Key? key}) : super(key: key);

  @override
  State<Story2> createState() => _Story2State();
}
class _Story2State extends State<Story2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Belling the Cat", style: TextStyle(fontSize: 30)),
        backgroundColor: const Color(0xFF20BF55),
        bottom: PreferredSize(
            child: Container(
              color: Color(0xFF37323E),
              height: 4.0,
            ),
            preferredSize: Size.fromHeight(24.0)),
      ),
      body: Page2_1(),
      backgroundColor: Color(0xFFE0DDCF),
    );
  }
}
class Page2_1 extends StatefulWidget {
  const Page2_1({Key? key}) : super(key: key);

  @override
  State<Page2_1> createState() => _Page2_1State();
}
class _Page2_1State extends State<Page2_1> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.all(50),
          child: Text(story2,
              style: TextStyle(color: Colors.black, fontSize: 20))
      ),
    );
  }
}

class Story3 extends StatefulWidget {
  const Story3({Key? key}) : super(key: key);

  @override
  State<Story3> createState() => _Story3State();
}
class _Story3State extends State<Story3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("The town mouse & the country mouse", style: TextStyle(fontSize: 28)),
        backgroundColor: const Color(0xFF20BF55),
        bottom: PreferredSize(
            child: Container(
              color: Color(0xFF37323E),
              height: 4.0,
            ),
            preferredSize: Size.fromHeight(24.0)),
      ),
      body: Page3_1(),
      backgroundColor: Color(0xFFE0DDCF),
    );
  }
}
class Page3_1 extends StatefulWidget {
  const Page3_1({Key? key}) : super(key: key);

  @override
  State<Page3_1> createState() => _Page3_1State();
}
class _Page3_1State extends State<Page3_1> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.all(50),
          child: Text(story3,
              style: TextStyle(color: Colors.black, fontSize: 20))
      ),
    );
  }
}

class Story4 extends StatefulWidget {
  const Story4({Key? key}) : super(key: key);

  @override
  State<Story4> createState() => _Story4State();
}
class _Story4State extends State<Story4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("The Fox & the grapes", style: TextStyle(fontSize: 28)),
        backgroundColor: const Color(0xFF20BF55),
        bottom: PreferredSize(
            child: Container(
              color: Color(0xFF37323E),
              height: 4.0,
            ),
            preferredSize: Size.fromHeight(24.0)),
      ),
      body: Page4_1(),
      backgroundColor: Color(0xFFE0DDCF),
    );
  }
}
class Page4_1 extends StatefulWidget {
  const Page4_1({Key? key}) : super(key: key);

  @override
  State<Page4_1> createState() => _Page4_1State();
}
class _Page4_1State extends State<Page4_1> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.all(50),
          child: Text(story4,
              style: TextStyle(color: Colors.black, fontSize: 20))
      ),
    );
  }
}





