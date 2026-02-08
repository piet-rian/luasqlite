--- じゃんけんの勝敗を判定する関数
-- 引数
--  player1 - プレイヤー1の手 ('r', 'p', 's')
--  player2 - プレイヤー2の手 ('r', 'p', 's
-- 戻り値
--  int - -1: プレイヤー2の勝ち, 0: 引き分け, 1: プレイヤー1の勝ち
function Judge(player1, player2)
  -- 勝敗テーブル
  local win_table = {
    r = { r =  0, p = -1, s =  1 },
    p = { r =  1, p =  0, s = -1 },
    s = { r = -1, p =  1, s =  0 }
  }

  return win_table[player1][player2]
end

--- じゃんけんの勝敗メッセージを取得する関数
-- @param result  int
--  result - 勝敗結果 (-1, 0, 1)
-- 戻り値
--  string - 勝敗メッセージ
function MessageType(result)
  if result == 1 then
    return "プレイヤー1の勝ち"
  elseif result == -1 then
    return "プレイヤー2の勝ち"
  else
    return "引き分け"
  end
end

local result = Judge('r', 'p')
local message = MessageType(result)
print("Message: " .. message) -- 出力: Message: プレイヤー1の
