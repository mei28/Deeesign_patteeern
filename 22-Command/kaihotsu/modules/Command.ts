//コマンドインターフェイス
import Receiver from "./Receiver";

export default interface Command {
  setReceiver(receiver: Receiver): void;
  execute(): void;
}