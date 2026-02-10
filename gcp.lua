--- @alias Hand string グー(r)、パー(p)、チョキ(s)のいずれか
Hand = { r = "r", p = "p", s = "s" }

--- @alias Result string 勝敗結果 "Win"、"Draw"、"Lose"のいずれか
Result = { winn = "Win", draw = "Draw", lose = "Lose" }

--- じゃんけんの勝敗を判定する関数
--- @param player1 Hand
--- @param player2 Hand
--- @return Result
function Judge(player1, player2)
  -- 勝敗テーブル
  local win_table = {
    [Hand.r] = { [Hand.r] = Result.draw, [Hand.p] = Result.lose, [Hand.s] = Result.winn },
    [Hand.p] = { [Hand.r] = Result.winn, [Hand.p] = Result.draw, [Hand.s] = Result.lose },
    [Hand.s] = { [Hand.r] = Result.lose, [Hand.p] = Result.winn, [Hand.s] = Result.draw },
  }

  return win_table[player1][player2]
end

--- プレイヤーの手をランダムに決定
--- 手の種類はHand型から選ぶ
--- @return Hand
function CreateHand()
  local hands = { Hand.r, Hand.p, Hand.s }
  local index = math.random(1, #hands)
  return hands[index]
end

--[[
  じゃんけんを行う
  @return { player1: Hand, player2: Hand, result: Result }
--]]
function PlayJanken()
  local player1_hand = CreateHand()
  local player2_hand = CreateHand()
  local result = Judge(player1_hand, player2_hand)

  return {
    player1 = player1_hand,
    player2 = player2_hand,
    result = result
  }
end

--- じゃんけんの実行結果をファイルに保存する
--- @param game_result { player1: Hand, player2: Hand, result: Result }
--- @param file file*
--- @return nil
function SaveJankenResultToFile(game_result, file)
  local line = JankenResultToString(game_result) .. "\n"
  file:write(line)
end

--- じゃんけんの実行結果の文字列表現を生成する
--- @param game_result { player1: Hand, player2: Hand, result: Result }
--- @return string
function JankenResultToString(game_result)
  local p1 = game_result.player1
  local p2 = game_result.player2
  local result = game_result.result
  return (p1 .. " vs " .. p2 .. " => " .. result)
end

-- 起動引数からじゃんけんの回数を取得（デフォルトは10回）
local janken_count = arg[1] and tonumber(arg[1]) or 10

-- じゃんけんを10回実行して結果を表示し、ファイルに保存する
local result_log_file_name = "janken_results.txt"
local file = io.open(result_log_file_name, "a")

if file then
  for _ = 1, janken_count do
    local game_result = PlayJanken()
    SaveJankenResultToFile(game_result, file)
  end
  file:close()
end
