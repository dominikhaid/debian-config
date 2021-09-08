vim.g.startify_session_autoload = 1
vim.g.startify_session_delete_buffers = 1
vim.g.startify_change_to_dir = 1
vim.g.startify_session_persistence = 1
vim.g.startify_session_before_save = "silent! NvimTreeColse"

local function gitUnstaged()
  local handle = io.popen("git rev-parse --is-inside-work-tree 2>/dev/null")
  local is_repo = handle:read("*a")
  handle:close()
  if not (is_repo == "true") then
  --return
  end

  handle = io.popen("git ls-files -m")
  local changed = handle:read("*a")
  local output = {}
  handle:close()
  for file in string.gmatch(changed, "%w*%p%w%w?%w") do
    table.insert(output, {line = (file), cmd = ("edit " .. file .. "")})
  end
  return output
end

local function gitCommits()
  local handle = io.popen("git log --oneline 2>/dev/null | head -n5")

  local commits = handle:read("*a")
  handle:close()
  local output = {}
  Tmp = ""

  local tmpName = os.tmpname()
  local tmpFile = io.open(tmpName, "w+")
  tmpFile:write(commits)
  tmpFile:flush()
  tmpFile:close()
  local tmpFileRead = io.open(tmpName, "r")

  for line in tmpFileRead:lines() do
    local hash = (line):gsub("^(%w+).*", "%1", 1)
    local name = (line):gsub("^%w+(.*)", "%1", 1)
    --print(line)
    --print(hash)
    --print(name)
    table.insert(output, {line = ("" .. name .. " " .. hash .. ""), cmd = ("Git show " .. hash .. "")})
  end

  tmpFileRead:close()
  return output
end

gitCommits()

local function gitUntracked()
  local handle = io.popen("git ls-files -o --exclude-standard 2>/dev/null")
  local untracked = handle:read("*a")
  local output = {}
  handle:close()
  for file in string.gmatch(untracked, "%w*%p%w%w?%w") do
    table.insert(output, {line = (file), cmd = ("edit " .. file .. "")})
  end
  return output
end

vim.g["startify_lists"] = {
  {
    header = {("   Recent Files in: " .. vim.fn.getcwd())},
    type = "dir"
  },
  {header = {"   Bookmarks"}, type = "bookmarks"},
  {header = {"   Sessions"}, type = "sessions"},
  {
    header = {("   Unstaged")},
    type = gitUnstaged
  },
  {
    header = {("   Last Commits")},
    type = gitCommits
  },
  {
    header = {("   Untracked Files in: ")},
    type = gitUntracked
  },
  {
    header = {"   Recent Global Files"},
    type = "files"
  }
}
