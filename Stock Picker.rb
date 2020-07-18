# nondestructively removes the last variable from the starting array and then finds the smallest value which is our buy value.
def buy(stonks)

  final_cut = stonks.slice(0, stonks.length - 1)
  smallest = final_cut.min
  buy_day = final_cut.find {|stock| stock <= smallest}

return buy_day  

end

# Uses the buy method to find what index number needs to be removed so that you do not sell before you buy.
def selling_array(stonks) 
 
  index_to_remove = stonks.find_index(buy(stonks))
  
return index_to_remove + 1   

end

#reverses the initial array of stocks and then slices off all the stocks before and including the buy variable(I know I can probably do this without the reverse but my brain tried this first). you then find the biggest stock left and return it.
def sell(stonks)
  
reversed = stonks.reverse
stocks_you_can_sell = stonks.slice(selling_array(stonks),100)
biggest = stocks_you_can_sell.max
sell_day = stocks_you_can_sell.find {|stock| stock <= biggest}
 
return sell_day

end

#takes the selling price and subtracts it from the buying price to get profit. Creates a statement with when to buy/sell and a statement telling you your profit.
def final_choice (stonks)
  
  profit = sell(stonks) - buy(stonks)
  earnings_statement = "Congratulations, you made #{profit} dollars!"
  final_array = ["Buy at this price:",buy(stonks),"Sell at this price:",sell(stonks)]

return final_array, earnings_statement

end

puts final_choice ([17, 3, 6, 9, 15, 8, 6, 1, 10])
 
#=> Buy at this price:1 Sell at this price:10 Congratulations, you made 9 dollars!

#apologies for any spelling/grammer mistakes :)