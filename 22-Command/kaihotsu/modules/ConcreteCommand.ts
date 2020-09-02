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
    console.log(this.receiver.action(this.number));
  }
}