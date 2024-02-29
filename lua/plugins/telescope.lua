require("telescope").setup {
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<c-d>"] = "delete_buffer",
        },
        n = {
          ["d"] = "delete_buffer",
        },
      }
    }
  }
}
