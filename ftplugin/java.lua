local ok, jdtls = pcall(require, "jdtls")
if not ok then
  vim.notify("nvim-jdtls not installed yet — run :Lazy sync", vim.log.levels.WARN)
  return
end

local data = vim.fn.stdpath("data")
local mason_pkgs = data .. "/mason/packages"

local root_dir = vim.fs.root(0, {
  "settings.gradle",
  "settings.gradle.kts",
  "build.gradle",
  "build.gradle.kts",
  "gradlew",
  "mvnw",
  "pom.xml",
  ".git",
})
if not root_dir then
  return
end

local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = data .. "/jdtls-workspaces/" .. project_name

local bundles = {}
local function add_bundles(glob)
  vim.list_extend(bundles, vim.split(vim.fn.glob(glob, true), "\n", { trimempty = true }))
end
add_bundles(mason_pkgs .. "/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar")
add_bundles(mason_pkgs .. "/java-test/extension/server/*.jar")
add_bundles(mason_pkgs .. "/vscode-spring-boot-tools/extension/jars/*.jar")

local lombok = data .. "/jdtls-lombok/lombok.jar"

local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok_blink, blink = pcall(require, "blink.cmp")
if ok_blink then
  capabilities = blink.get_lsp_capabilities(capabilities)
end

local cmd = {
  data .. "/mason/bin/jdtls",
  "-data",
  workspace_dir,
}
if vim.fn.filereadable(lombok) == 1 then
  table.insert(cmd, "--jvm-arg=-javaagent:" .. lombok)
end

local config = {
  cmd = cmd,
  root_dir = root_dir,
  capabilities = capabilities,
  init_options = {
    bundles = bundles,
  },
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-21",
            path = "/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home",
            default = true,
          },
        },
      },
      import = { gradle = { enabled = true } },
      eclipse = { downloadSources = true },
      maven = { downloadSources = true },
      references = { includeDecompiledSources = true },
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" },
      inlayHints = { parameterNames = { enabled = "all" } },
      completion = {
        favoriteStaticMembers = {
          "org.junit.jupiter.api.Assertions.*",
          "org.mockito.Mockito.*",
          "org.assertj.core.api.Assertions.*",
        },
        importOrder = { "java", "javax", "org", "com", "uz" },
      },
      sources = {
        organizeImports = { starThreshold = 9999, staticStarThreshold = 9999 },
      },
    },
  },
}

config.on_attach = function(_, bufnr)
  local function map(keys, fn, desc)
    vim.keymap.set("n", keys, fn, { buffer = bufnr, desc = "Java: " .. desc })
  end
  map("<leader>jo", jdtls.organize_imports, "Organize imports")
  map("<leader>jv", jdtls.extract_variable, "Extract variable")
  map("<leader>jc", jdtls.extract_constant, "Extract constant")
  map("<leader>jt", jdtls.test_nearest_method, "Test nearest method")
  map("<leader>jT", jdtls.test_class, "Test class")

  local function gradle(task)
    local gradlew = root_dir .. "/gradlew"
    local cmd_str = (vim.fn.filereadable(gradlew) == 1 and "./gradlew" or "gradle") .. " " .. task
    vim.cmd("botright split | lcd " .. vim.fn.fnameescape(root_dir) .. " | terminal " .. cmd_str)
  end
  map("<leader>jb", function() gradle("clean build") end, "Gradle clean build")
  map("<leader>jB", function() gradle("build") end, "Gradle build")
  map("<leader>jr", function() gradle("bootRun") end, "Gradle bootRun")

  pcall(function()
    jdtls.setup_dap({ hotcodereplace = "auto" })
    require("jdtls.dap").setup_dap_main_class_configs()
  end)
end

jdtls.start_or_attach(config)
