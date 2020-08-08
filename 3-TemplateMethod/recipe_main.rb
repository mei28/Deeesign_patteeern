require "./recipe"

SEPARATOR_COUNT = 40

puts "=" * SEPARATOR_COUNT
title = "カレー"
foods = ["人参", "じゃがいも", "玉ねぎ", "肉"]
curry_cooker = CurryCooker.new(title, foods)
curry_cooker.cook

puts "=" * SEPARATOR_COUNT
title = "豚の生姜焼き"
foods = ["生姜"]
gingerpork_cooker = GingerPorkCooker.new(title, foods)
gingerpork_cooker.cook
