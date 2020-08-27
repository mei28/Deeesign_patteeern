import Mediator from "./Mediator";
import Colleague from "./Colleague";

export default class NumberMediator implements Mediator {
  private numbers: number[] = [1, 2, 3, 4, 5, 6];
  private firstNumber: Colleague;
  private secondNumber: Colleague;

  createColleagues(firstColleague: Colleague, secondColleague: Colleague): void {
    this.firstNumber = firstColleague;
    this.secondNumber = secondColleague;
  }

  resultColleague(colleague: Colleague): number {
    if (this.firstNumber.getColleagueValue() === this.secondNumber.getColleagueValue()) {
      return this.getRandomNumber();
    }

    if (this.firstNumber.getColleagueValue() !== 0) {
      this.spliceNumbers(this.firstNumber.getColleagueValue());
      return this.getRandomNumber();
    }

    if (this.secondNumber.getColleagueValue() !== 0) {
      this.spliceNumbers(this.secondNumber.getColleagueValue());
      return this.getRandomNumber();
    }

    return colleague.getColleagueValue();
  }

  private spliceNumbers(number: number): void {
    this.numbers.splice(this.numbers.indexOf(number), 1);
  }

  private getRandomNumber(): number {
    return this.numbers[
      Math.floor(Math.random() * this.numbers.length)
    ];
  }
}