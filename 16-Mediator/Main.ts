import Mediator from "./modules/Mediator";
import NumberMediator from "./modules/NumberMediator";
import Colleague from "./modules/Colleague";
import NumberColleague from "./modules/NumberColleague";

const mediator: Mediator = new NumberMediator;
const firstColleague: Colleague = new NumberColleague;
const secondColleague: Colleague = new NumberColleague;

//調停者に数値クラスをセット
mediator.createColleagues(firstColleague, secondColleague);

//数値クラスに調停者クラスをセット
firstColleague.setMediator(mediator);
secondColleague.setMediator(mediator);

//数値をセット
//このときMediatorのおかげで２つの数字はかぶらない！！！
secondColleague.setColleagueValue();
firstColleague.setColleagueValue();

//結果を出力
console.log('一つ目: ' + firstColleague.getColleagueValue());
console.log('二つ目: ' + secondColleague.getColleagueValue());