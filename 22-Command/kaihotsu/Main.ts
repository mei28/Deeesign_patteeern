import Receiver from "./modules/Receiver";
import Invoker from "./modules/Invoker";
import Command from "./modules/Command";
import ConcreteCommand from "./modules/ConcreteCommand";
import ConcreteCommand2 from "./modules/ConcreteCommand2";


const receiver: Receiver = new Receiver;
const invoker: Invoker = new Invoker;

//コマンドインスタンスを作成。
const threeCommand: Command = new ConcreteCommand(3);
//レシーバー(命令の受取り手(インターフェイス/API)をセット)
threeCommand.setReceiver(receiver);
const fiveCommand: Command = new ConcreteCommand(5);
fiveCommand.setReceiver(receiver);

const tenSumCommand: Command = new ConcreteCommand2(10);
tenSumCommand.setReceiver(receiver);

//コマンドをキューに追加
invoker.addCommand(threeCommand);
invoker.addCommand(fiveCommand);
invoker.addCommand(tenSumCommand);
invoker.addCommand(fiveCommand);

//コマンドをキューから実行
invoker.execute();
invoker.undoCommand()

invoker.printHistory()
invoker.execute();
