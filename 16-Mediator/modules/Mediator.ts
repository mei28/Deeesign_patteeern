//調整役を表現するインターフェース。型定義用??
import Colleague from "./Colleague";

export default interface Mediator {
  createColleagues(firstColleague: Colleague, secondColleague: Colleague): void;
  resultColleague(colleague: Colleague): number;
}