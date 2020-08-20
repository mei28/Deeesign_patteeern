//悪い例
cecream ice = new CashewNutsVanillaIcecream();

// 良い例
Icecream ice1 = new CashewNutsToppingIcecream(new VanillaIcecream());
Icecream ice2 = new CashewNutsToppingIcecream(new GreenTeaIcecream());
Icecream ice3 = new SliceAlmondToppingIcecream(new CashewNutsToppingIcecream(new VanillaIcecream()));
