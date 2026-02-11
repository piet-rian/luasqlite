local DBClass = require("sql-orm")

local DBIns, Table, Field, OrderBy = DBClass({
  new_table = true,
  db_path = "database.db",
  db_type = "sqlite3",
  log_debug = true,
  log_trace = true
})

local Results = Table({
  table_name = "results",
  column_order = { "p1", "p2", "result" },

}, {
  p1 = Field.CharField({
    max_length = 1,
  }),
  p2 = Field.CharField({
    max_length = 1,
  }),
  result = Field.IntegerField({
    max_length = 2,
  }),
})

local result = Results({
  p1 = "r",
  p2 = "p",
  result = -1
})
result:save()

local results = Results.get:all()

for _, result in ipairs(results) do
  print(result.p1, result.p2, result.result)
end

DBIns:close()
