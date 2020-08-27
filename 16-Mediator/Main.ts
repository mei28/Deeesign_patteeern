import Mediator from "./modules/Mediator";
import NumberMediator from "./modules/NumberMediator";
import Colleague from "./modules/Colleague";
import NumberColleague from "./modules/NumberColleague";

const mediator: Mediator = new NumberMediator;
const firstColleague: Colleague = new NumberColleague;
const secondColleague: Colleague = new NumberColleague;

mediator.createColleagues(firstColleague, secondColleague);

firstColleague.setMediator(mediator);
secondColleague.setMediator(mediator);

firstColleague.setColleagueValue();
secondColleague.setColleagueValue();

console.log('一つ目: ' + firstColleague.getColleagueValue());
console.log('二つ目: ' + secondColleague.getColleagueValue());