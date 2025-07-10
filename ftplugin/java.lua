local HOME = os.getenv("HOME")

local JDTLS_INSTALL_DIR = HOME .. "/.local/share/nvim/mason/packages/jdtls"

local JDTLS_JAR_PATH = vim.fn.glob(JDTLS_INSTALL_DIR .. "/plugins/org.eclipse.equinox.launcher_*.jar", false, false)
local JDTLS_CONFIG_PATH = JDTLS_INSTALL_DIR .. "/config_linux"

local JDTLS_WORKSPACE_CACHE_DIR = HOME .. "/.cache/jdtls/workspace-" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local WORKSPACE_ROOT_MARKERS = { ".git", "mvnw", "gradlew", "build.gradle" }
local WORKSPACE_ROOT_DIR = vim.fs.root(0, WORKSPACE_ROOT_MARKERS)

local EXTENDED_CLIENT_CAPABILITIES = require("jdtls").extendedClientCapabilities

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
  cmd = {
    "/usr/lib/jvm/java-21-openjdk/bin/java",

    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",

    "-jar",
    JDTLS_JAR_PATH,

    "-configuration",
    JDTLS_CONFIG_PATH,

    "-data",
    JDTLS_WORKSPACE_CACHE_DIR,
  },

  root_dir = WORKSPACE_ROOT_DIR,

  settings = {
    java = {
      configuration = {
        maven = {
          userSettings = "/home/gael/.m2/settings.xml",
        },
        runtimes = {
          {
            name = "JavaSE-21",
            path = "/usr/lib/jvm/java-21-openjdk",
            javadoc = "/usr/share/doc/java21-openjdk/api/",
            sources = "/usr/lib/jvm/java-21-openjdk/lib/src.zip",
            default = true,
          },
        },
        updateBuildConfiguration = "automatic",
      },
      contentProvider = {
        preferred = "fernflower",
      },
      format = {
        comments = { enabled = false },
        enabled = true,
        insertSpaces = true,
        settings = {
          url = vim.fn.stdpath "config" .. "/codestyle/java.xml",
          profile = "FoxilsStyle",
        },
        tabSize = 4,
      },
      imports = {
        gradle = {
          enabled = true,
          wrapper = {
            enabled = true,
            checksums = {
              {
                sha256 = "7d3a4ac4de1c32b59bc6a4eb8ecb8e612ccd0cf1ae1e99f66902da64df296172",
                allowed = true,
              },
            },
          },
        },
      },
      maven = {
        downloadSources = true,
      },
      memberSortOrder = "SF, SI, SM, F, I, C, M, T", -- Static Fields, Static Initializers, Static Methods, Fields, Initializers, Constructors, Methods, Types
    },
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don"t plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {},
    extendedClientCapabilities = EXTENDED_CLIENT_CAPABILITIES,
  },
}

require("jdtls").start_or_attach(config)
