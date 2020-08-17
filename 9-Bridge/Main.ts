import Greet from "./modules/Greet";
import ChatGreetImpl from "./modules/ChatGreetImpl";
import RepeatGreet from "./modules/RepeatGreet";
// 機能クラス(実装クラス)
const greet1: Greet = new Greet(new ChatGreetImpl('Good Morning'));
const greet2: Greet = new RepeatGreet(new ChatGreetImpl('Hello'));
const greet3: RepeatGreet = new RepeatGreet(new ChatGreetImpl('Good Evening'));

greet1.display();
greet2.display();
greet3.display();
greet3.repeatDisplay();