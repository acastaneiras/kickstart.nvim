local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets('php', {
  s('e', {
    t 'echo "',
    i(1),
    t '";',
  }),
  s('te', {
    t 'echo __("',
    i(1),
    t '", "");',
  }),
  s('vare', {
    t 'echo "<pre>".var_export(',
    i(1, '$variable'),
    t ', true)."</pre>";',
  }),
  s('phpe', {
    t '<?= ',
    i(1, ''),
    t ' ?>',
  }),
  s('phpte', {
    t '<?= __("',
    i(1, ''),
    t '", "") ?>',
  }),
  s('pvare', {
    t '<?= "<pre>".var_export(',
    i(1, '$variable'),
    t ', true)."</pre>"; ?>',
  }),
  s(
    'if',
    fmt(
      [[
    if ({}) {{
        {}
    }}
  ]],
      { i(1, '$condition'), i(2) }
    )
  ),
  s(
    'ife',
    fmt(
      [[
    if ({}) {{
        {}
    }} else {{
        {}
    }}
  ]],
      { i(1, '$condition'), i(2), i(3) }
    )
  ),
  s(
    'foreach',
    fmt(
      [[
    foreach ({}) as {} => {} {{
        {}
    }}
  ]],
      { i(1, '$array'), i(2, '$key'), i(3, '$value'), i(4) }
    )
  ),
  s(
    'for',
    fmt(
      [[
    for ({}; {}; {}) {{
        {}
    }}
  ]],
      { i(1, '$i = 0'), i(2, '$i < 10'), i(3, '$i++'), i(4) }
    )
  ),
  s(
    'fn',
    fmt(
      [[
    function {}({}) {{
        {}
    }}
  ]],
      { i(1, 'name'), i(2), i(3) }
    )
  ),
  s(
    'pubf',
    fmt(
      [[
    public function {}({}) {{
        {}
    }}
  ]],
      { i(1, 'name'), i(2), i(3) }
    )
  ),
  s(
    'protf',
    fmt(
      [[
    protected function {}({}) {{
        {}
    }}
  ]],
      { i(1, 'name'), i(2), i(3) }
    )
  ),
  s(
    'privf',
    fmt(
      [[
    private function {}({}) {{
        {}
    }}
  ]],
      { i(1, 'name'), i(2), i(3) }
    )
  ),
  s(
    'class',
    fmt(
      [[
    class {} {{
        {}
    }}
  ]],
      { i(1, 'ClassName'), i(2) }
    )
  ),
  s('ns', fmt('namespace {};', { i(1, 'App\\') })),
  s('use', fmt('use {};', { i(1, 'App\\...') })),
})
