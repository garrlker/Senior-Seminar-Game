instance_create(x + 8, y + 8, oCratePoof);

var coins = random_range(4, 8);

repeat(coins){
    instance_create(x + 8, y + 8, oCoin);
}