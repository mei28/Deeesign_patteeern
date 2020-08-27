//数を表現するインターフェース。型定義用??
import Mediator from "./Mediator";

export default interface Colleague {
  setMediator(mediator: Mediator): void;
  getColleagueValue(): number;
  setColleagueValue(): void;
}