//数値を表現するクラスです。
import Colleague from "./Colleague";
import Mediator from "./Mediator";

export default class NumberColleague implements Colleague {
  private mediator: Mediator;
  private value: number = 0;

//調停者をセット
  setMediator(mediator: Mediator): void {
    this.mediator = mediator;
  }

  //数値を返す
  getColleagueValue(): number {
    return this.value;
  }

  //調停済みの数値をセット
  setColleagueValue(): void {
    this.value = this.mediator.resultColleague(this);
  }
}