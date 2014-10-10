json.status "success"
json.data do 
  json.winner @item.winnerId
  json.price @item.winningAmt
end
