--- @alias Hand string グー(r)、パー(p)、チョキ(s)のいずれか
Hand = { r = "r", p = "p", s = "s" }

--- @alias Result string 勝敗結果 "Win"、"Draw"、"Lose"のいずれか
Result = { winn = "Win", draw = "Draw", lose = "Lose" }

--- じゃんけんの勝敗を判定する関数
--- @param player1 Hand
--- @param player2 Hand
--- @return Result
local function Judge(player1, player2)
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
local function CreateHand()
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
