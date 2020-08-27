import Mediator from "./Mediator";
import Colleague from "./Colleague";

//調整役を表現するクラスです。
export default class NumberMediator implements Mediator {
    private numbers: number[] = [1, 2, 3, 4, 5, 6];
    private firstNumber: Colleague;
    private secondNumber: Colleague;

    //面倒をみる対象の数値クラスをセット
    createColleagues(firstColleague: Colleague, secondColleague: Colleague): void {
        this.firstNumber = firstColleague;
        this.secondNumber = secondColleague;
    }

    //かぶらない数字を返す。
    resultColleague(colleague: Colleague): number {
        //2つの数値が同じ(0)のとき新たな数値返す。
        if (this.firstNumber.getColleagueValue() === this.secondNumber.getColleagueValue()) {
            return this.getRandomNumber();
        }

        //１つ目の数値が初期状態(0)じゃなかったら、選択可能な数字を更新し新しい数字を返す。
        if (this.firstNumber.getColleagueValue() !== 0) {
            this.spliceNumbers(this.firstNumber.getColleagueValue());
            return this.getRandomNumber();
        }
        //2つ目の数値が初期状態(0)じゃなかったら、選択可能な数字を更新し新しい数字を返す。

        if (this.secondNumber.getColleagueValue() !== 0) {
            this.spliceNumbers(this.secondNumber.getColleagueValue());
            return this.getRandomNumber();
        }

        // 例外のとき0を返す(なぜ？？)
        return colleague.getColleagueValue();
    }

    //選択可能な数字を更新
    private spliceNumbers(number: number): void {
        this.numbers.splice(this.numbers.indexOf(number), 1);
    }

    private getRandomNumber(): number {
        return this.numbers[
            Math.floor(Math.random() * this.numbers.length)
        ];
    }
}