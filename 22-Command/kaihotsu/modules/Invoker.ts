//コマンドの呼び出しをする。
import Command from "./Command";

export default class Invoker {
  private commands: Command[] = [];

  addCommand(command: Command): void {
    console.log("######## add command ######## ")
    this.commands.push(command);
    console.log(command)
    console.log("#############################\n")
  }

  undoCommand(): void {
    console.log("~~~~~~~~~~~~~  undo  ~~~~~~~~~~~")
    console.log(this.commands.pop())
    console.log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n")
  }

  execute(): void {
    console.log("---------  start commands  ---------")
    for (const command of this.commands) {
      command.execute();
    }
    console.log("-----------------------------------\n")
  }

  printHistory(): void {
    console.log("*******  command history  *********")
    for (const command of this.commands) {
      console.log(command)
    }
    console.log("************************************\n")
  }
}