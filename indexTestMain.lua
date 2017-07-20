require "ATR"
require "BBI"
require "BOLL"
require "EMA"
require "KDJ"
require "MA"
require "MACD"
require "MAVOL"
require "MIKE"
require "RSI"
require "TD"

function reverseTable(tab)
    local tmp = {}
    for i = 1, #tab do
        local key = #tab
        tmp[i] = table.remove(tab)
    end

    return tmp
end

function main()

  local file = io.open("600887_kdata.json", "r");
  local jsonString = file:read("*a")
  file:close()

  local cjson = require("cjson")
  local aryList = reverseTable(cjson.decode(jsonString));

  aryTDs = MAIndex(aryList, "close_price", {2, 4, 6, 8})

  -- 指标

  print(#aryTDs)

  for i = 1, #aryTDs, 1 do

  	print("MA2", aryTDs[i]["MA2"])
  end

end

main()
