import Colleague from "./Colleague";
import Mediator from "./Mediator";

export default class NumberColleague implements Colleague {
  private mediator: Mediator;
  private value: number = 0;

  setMediator(mediator: Mediator): void {
    this.mediator = mediator;
  }

  getColleagueValue(): number {
    return this.value;
  }

  setColleagueValue(): void {
    this.value = this.mediator.resultColleague(this);
  }
}