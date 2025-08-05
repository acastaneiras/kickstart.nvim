local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

local snippets = {
  s('clg', fmt('console.log({});', { i(1) })),
  s('clo', fmt('console.log("{}", {});', { i(1, 'label'), i(2, 'value') })),
  s('rlog', fmt('return console.log({});', { i(1) })),
  s(
    'af',
    fmt('const {} = ({}) => {{\n  {}\n}};', {
      i(1, 'funcName'),
      i(2),
      i(3, '// body'),
    })
  ),
  s(
    'fn',
    fmt('function {}({}) {{\n  {}\n}}', {
      i(1, 'funcName'),
      i(2),
      i(3, '// body'),
    })
  ),
  s(
    'try',
    fmt(
      [[
    try {{
      {}
    }} catch ({}) {{
      console.error({});
    }}
  ]],
      {
        i(1, '// code'),
        i(2, 'err'),
        rep(2),
      }
    )
  ),
  s(
    'fetch',
    fmt(
      [[
    fetch("{}")
      .then((res) => res.json())
      .then((data) => {{
        {}
      }})
      .catch((err) => console.error(err));
  ]],
      {
        i(1, 'https://api.example.com'),
        i(2, '// handle data'),
      }
    )
  ),
  s(
    'fe',
    fmt('{}.forEach(({}) => {{\n  {}\n}});', {
      i(1, 'array'),
      i(2, 'item'),
      i(3, '// body'),
    })
  ),

  s(
    'map',
    fmt('const {} = {}.map(({}) => {{\n  return {};\n}});', {
      i(1, 'result'),
      i(2, 'array'),
      i(3, 'item'),
      i(4, 'item'),
    })
  ),

  s(
    'ari',
    fmt('const {} = ({}) => {};', {
      i(1, 'name'),
      i(2),
      i(3),
    })
  ),
}

ls.add_snippets('javascript', snippets)
ls.add_snippets('typescript', snippets)
