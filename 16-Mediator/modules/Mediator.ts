import Colleague from "./Colleague";

export default interface Mediator {
  createColleagues(firstColleague: Colleague, secondColleague: Colleague): void;
  resultColleague(colleague: Colleague): number;
}