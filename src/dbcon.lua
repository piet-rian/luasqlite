-- lsqlite3 による sqlite3 データベース接続おためし

local sqlite3 = require("lsqlite3")

-- データベースファイルを開く
local db = sqlite3.open("test.db")
if not db then
    error("データベースを開けませんでした")
end

-- テーブルを作成する
-- p1 char(1)
-- p2 char(1)
-- result int
local create_table_sql = [[
CREATE TABLE IF NOT EXISTS results (
    p1 CHAR(1),
    p2 CHAR(1),
    result INT
);
]]
local rc = db:exec(create_table_sql)
if rc ~= sqlite3.OK then
    error("テーブルの作成に失敗しました: " .. db:errmsg())
end

-- データを挿入する
local insert_sql = "INSERT INTO results (p1, p2, result) VALUES (?, ?, ?);"
local stmt = db:prepare(insert_sql)
if not stmt then
    error("ステートメントの準備に失敗しました: " .. db:errmsg())
end

local data = {
    { "r", "r", 0 },
    { "r", "p", -1 },
    { "r", "s", 1 },
}

for _, row in ipairs(data) do
    stmt:bind_values(row[1], row[2], row[3])
    rc = stmt:step()
    if rc ~= sqlite3.DONE then
        error("データの挿入に失敗しました: " .. db:errmsg())
    end
    stmt:reset()
end

stmt:finalize()

-- データを取得して表示する
local select_sql = "SELECT p1, p2, result FROM results;"
for row in db:nrows(select_sql) do
    print(string.format("p1: %s, p2: %s, result: %d", row.p1, row.p2, row.result))
end

-- データベースを閉じる
db:close()
