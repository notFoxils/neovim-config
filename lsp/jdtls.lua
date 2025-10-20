return {
  cmd = { "jdtls" },
  root_markers = { ".git", "mvnw", "gradlew", "build.gradle" },
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
  init_options = {
    bundles = {},
  },
}
