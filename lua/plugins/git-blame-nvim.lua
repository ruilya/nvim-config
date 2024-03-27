require('gitblame').setup {
     --Note how the `gitblame_` prefix is omitted in `setup`
    enabled = true,
    message_template = '<summary> • <date> • <author>',
    date_format = '%a %x %H:%M',
    display_virtual_text = 0,
}
