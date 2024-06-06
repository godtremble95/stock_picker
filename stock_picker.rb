def stock_picker(daily_prices)
  profit = {profit: 0, days: []}
  low_range_num = 0

  loop do
    highest_price = daily_prices.max
    day_to_sell = daily_prices.index(highest_price)

    break if day_to_sell < low_range_num
    (low_range_num ... day_to_sell).reverse_each do |indx|
      test_profit = highest_price - daily_prices[indx]

      if test_profit > profit[:profit]
        profit[:profit] = test_profit
        profit[:days] = [indx, day_to_sell]
      end
    end
    low_range_num = day_to_sell + 1
    daily_prices[day_to_sell] = 0
  end
  profit[:days]
end

p stock_picker([17,3,6,9,15,8,6,1,10])
