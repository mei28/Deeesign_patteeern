import Mediator from "./Mediator";

export default interface Colleague {
  setMediator(mediator: Mediator): void;
  getColleagueValue(): number;
  setColleagueValue(): void;
}