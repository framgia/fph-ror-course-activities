const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    // added the abosolute path for jquery
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: ['popper.js', 'default'],
    toastr: 'toastr/toastr',
    ApexCharts: ['apexcharts', 'default'],
    underscore: ['underscore', 'm'],
    Rails: ['@rails/ujs']
  })
)

module.exports = environment

// original
// const webpack = require('webpack')
// environment.plugins.append('Provide',
//   new webpack.ProvidePlugin({
//     $: 'jquery',
//     jQuery: 'jquery',
//     Popper: ['popper.js', 'default']
//   })
// )
// module.exports = environment