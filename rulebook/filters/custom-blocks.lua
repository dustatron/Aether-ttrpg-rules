local function typst_text(value)
  return value
    :gsub("\\", "\\\\")
    :gsub("%[", "\\[")
    :gsub("%]", "\\]")
end

local function wrap_div(div, function_name)
  local title = typst_text(div.attributes.title or "")
  local blocks = pandoc.List({
    pandoc.RawBlock("typst", "#" .. function_name .. "([" .. title .. "])["),
  })

  blocks:extend(div.content)
  blocks:insert(pandoc.RawBlock("typst", "]"))
  return blocks
end

function Div(div)
  if div.classes:includes("monster-card") then
    local name = typst_text(div.attributes.name or "")
    local tier = typst_text(div.attributes.tier or "")
    local label = typst_text(div.attributes.label or "")
    local blocks = pandoc.List({
      pandoc.RawBlock(
        "typst",
        "#monster-card([" .. name .. "], [" .. tier .. "], [" .. label .. "])["
      ),
    })
    blocks:extend(div.content)
    blocks:insert(pandoc.RawBlock("typst", "]"))
    return blocks
  end

  if div.classes:includes("prompt-card") then
    return wrap_div(div, "prompt-card")
  end

  if div.classes:includes("archetype-block") then
    local blocks = pandoc.List({
      pandoc.RawBlock("typst", "#archetype-block["),
    })
    blocks:extend(div.content)
    blocks:insert(pandoc.RawBlock("typst", "]"))
    return blocks
  end

  if div.classes:includes("stats-table-block") then
    local blocks = pandoc.List({
      pandoc.RawBlock("typst", "#stats-table-block["),
    })
    blocks:extend(div.content)
    blocks:insert(pandoc.RawBlock("typst", "]"))
    return blocks
  end

  if div.classes:includes("keep-together") then
    local blocks = pandoc.List({
      pandoc.RawBlock("typst", "#keep-together["),
    })
    blocks:extend(div.content)
    blocks:insert(pandoc.RawBlock("typst", "]"))
    return blocks
  end

  if div.classes:includes("wild-table-block") then
    local blocks = pandoc.List({
      pandoc.RawBlock("typst", "#wild-table-block["),
    })
    blocks:extend(div.content)
    blocks:insert(pandoc.RawBlock("typst", "]"))
    return blocks
  end

  if div.classes:includes("mutation-table-block") then
    local blocks = pandoc.List({
      pandoc.RawBlock("typst", "#mutation-table-block["),
    })
    blocks:extend(div.content)
    blocks:insert(pandoc.RawBlock("typst", "]"))
    return blocks
  end

  if div.classes:includes("spell-table-block") then
    local blocks = pandoc.List({
      pandoc.RawBlock("typst", "#spell-table-block["),
    })
    blocks:extend(div.content)
    blocks:insert(pandoc.RawBlock("typst", "]"))
    return blocks
  end
end

local function table_row_count(table)
  local count = #table.head.rows + #table.foot.rows

  for _, body in ipairs(table.bodies) do
    count = count + #body.head + #body.body
  end

  return count
end

function Table(table)
  if table_row_count(table) <= 8 then
    return {
      pandoc.RawBlock("typst", "#block(breakable: false)["),
      table,
      pandoc.RawBlock("typst", "]"),
    }
  end
end
