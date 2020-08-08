declare -A PATTERNS;

PATTERNS["1"]="Iterator"
PATTERNS["2"]="Adapter"
PATTERNS["3"]="TemplateMethod"
PATTERNS["4"]="FactoryMethod"
PATTERNS["5"]="Singleton"
PATTERNS["6"]="Prototype"
PATTERNS["7"]="Builder"
PATTERNS["8"]="AbstractFactory"
PATTERNS["9"]="Bridge"
PATTERNS["10"]="Strategy"
PATTERNS["11"]="Composite"
PATTERNS["12"]="Decorator"
PATTERNS["13"]="Visitor"
PATTERNS["14"]="ChainOfResponsibility"
PATTERNS["15"]="Facade"
PATTERNS["16"]="Mediator"
PATTERNS["17"]="Observer"
PATTERNS["18"]="Memento"
PATTERNS["19"]="State"
PATTERNS["20"]="Flyweight"
PATTERNS["21"]="Proxy"
PATTERNS["22"]="Command"
PATTERNS["23"]="Interpreter"

for key in ${!PATTERNS[*]};
do
    dir_name="${key}-${PATTERNS[$key]}"
    mkdir $dir_name
    touch $dir_name/.gitkeep
done
