// コマンドの実装２つ目
import Command from "./Command";
import Receiver from "./Receiver";

export default class ConcreteCommand implements Command {
  private number: number;
  private receiver: Receiver;

  constructor(number: number) {
    this.number = number;
  }

  setReceiver(receriver: Receiver): void {
    this.receiver = receriver;
  }

  execute(): void {
    this.receiver.action(this.number+this.number);
  }
}