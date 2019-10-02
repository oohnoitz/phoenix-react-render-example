require('@babel/polyfill')
require('@babel/register')({
  cwd: __dirname,
  presets: ["@babel/preset-typescript"],
  extensions: [".jsx", ".js", ".ts", ".tsx"]
})

module.exports = require('react_render/priv/server')
