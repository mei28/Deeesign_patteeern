import Receiver from "./modules/Receiver";
import Invoker from "./modules/Invoker";
import Command from "./modules/Command";
import ConcreteCommand from "./modules/ConcreteCommand";

const receiver: Receiver = new Receiver;
const invoker: Invoker = new Invoker;

const threeCommand: Command = new ConcreteCommand(3);
threeCommand.setReceiver(receiver);
const fiveCommand: Command = new ConcreteCommand(5);
fiveCommand.setReceiver(receiver);

invoker.addCommand(threeCommand);
invoker.addCommand(fiveCommand);

invoker.execute();