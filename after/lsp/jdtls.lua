-- NOTE:
-- Because the regular lsp config is parsed prior to plugin provided configs
--  we need to override those using the after directory.
-- Neovim config -> mfussenegger/nvim-jdtls -> Neovim config/after
-- (original)    -> (overwrite #1)          -> (overwrite #2)

-- NOTE:
-- This may be removed depending on what https://github.com/neovim/neovim/issues/33577 introduces

return {
    cmd = {
        "jdtls",
        "--jvm-arg=-Dosgi.configuration.area=@user.home/.config/osgi",
    },
}
