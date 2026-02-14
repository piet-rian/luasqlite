-- * 別ファイル(gcp.lua)のluaコードを読み込む
-- * `package.path` に読み込み対象となるファイルまでのパスを追加する必要がある
package.path = package.path .. ";./src/?.lua"
-- * Luaではモジュール名に拡張子を含めない (別ファイルの読込時も同じ)
require("gcp")
-- TODO: ネームスペース的なものの調査

--- じゃんけんの実行結果の文字列表現を生成する
--- @param game_result { player1: Hand, player2: Hand, result: Result }
--- @return string
function JankenResultToString(game_result)
  local p1 = game_result.player1
  local p2 = game_result.player2
  local result = game_result.result
  return (p1 .. " vs " .. p2 .. " => " .. result)
end

--- じゃんけんの実行結果をファイルに保存する
--- @param game_result { player1: Hand, player2: Hand, result: Result }
--- @param file file*
--- @return nil
function SaveJankenResultToFile(game_result, file)
  local line = JankenResultToString(game_result) .. "\n"
  file:write(line)
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
