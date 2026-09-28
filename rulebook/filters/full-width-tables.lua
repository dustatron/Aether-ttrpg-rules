-- Give every table explicit column proportions that add up to 100%.
-- Pandoc's Typst writer turns these into flexible columns that fill the
-- available column width.

local function cell_text_length(cell)
  local text = pandoc.utils.stringify(cell.contents)
  return math.max(1, utf8.len(text) or #text)
end

local function inspect_row(widths, row)
  for index, cell in ipairs(row.cells) do
    widths[index] = math.max(widths[index] or 1, cell_text_length(cell))
  end
end

function Table(table)
  local column_count = #table.colspecs
  if column_count == 0 then
    return table
  end

  local first_header = table.head.rows[1]
  if column_count == 2 and first_header then
    local first = pandoc.utils.stringify(first_header.cells[1].contents):lower()
    local second = pandoc.utils.stringify(first_header.cells[2].contents):lower()

    if first == "d6" and second == "perk" then
      table.colspecs[1] = { pandoc.AlignCenter, 0.13 }
      table.colspecs[2] = { table.colspecs[2][1], 0.87 }
      return table
    end
  end

  local widths = {}

  for _, row in ipairs(table.head.rows) do
    inspect_row(widths, row)
  end

  for _, body in ipairs(table.bodies) do
    for _, row in ipairs(body.head) do
      inspect_row(widths, row)
    end
    for _, row in ipairs(body.body) do
      inspect_row(widths, row)
    end
  end

  for _, row in ipairs(table.foot.rows) do
    inspect_row(widths, row)
  end

  local total = 0
  for index = 1, column_count do
    widths[index] = math.sqrt(widths[index] or 1)
    total = total + widths[index]
  end

  for index, spec in ipairs(table.colspecs) do
    table.colspecs[index] = { spec[1], widths[index] / total }
  end

  return table
end
