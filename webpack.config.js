const path = require('path');
const webpack = require('webpack');

module.exports = {
  // Our initial entry point for the app
  entry: {
    'index': './src/index.js'
  },

  // Where we output files
  output: {
    path: './dist',
    filename: '[name].js'
  },

  // How do you resolve modules?
  resolve: {
    // Which directories should we pretend are the current directory too?
    modulesDirectories: ['node_modules'],
    // Which file extensions do we know about automatically?
    // i.e. we don't have to specify their extension at require time.
    //
    // - the empty string means we can still specify an extension at require time
    // - js files, duh
    // - elm files
    extensions: ['', '.js', '.elm']
  },

  module: {
    loaders: [
      {
          test: /\.js$/,
          loaders: ['babel'],
          include: path.join(__dirname, 'src')
      },
      // We want to output html files from our project in the output directory
      {
        test: /\.html$/,
        include: path.join(__dirname, 'src'),
        loader: 'file?name=[name].[ext]'
      },

      // We want to load our elm files with the `elm-webpack` loader
      // (but don't load our dependencies with it, or anything in node_modules)
      // We also want to chain in `elm-hot`
      {
        test: /\.elm$/,
        include: path.join(__dirname, 'src'),
        loader: 'elm-hot!elm-webpack'
      },

      { test: /\.css$/, loader: 'style!css' },
      { test: /\.(png|jpg|jpeg|gif|woff)$/, loader: 'url?limit=8192' },
      { test: /\.(otf|eot|ttf)$/, loader: "file?prefix=font/" },
      { test: /\.svg$/, loader: "file" }
    ],

    // Don't try to parse elm files, because they will never `require` another module
    noParse: /\.elm$/
  },

  // Hey let's have a dev server
  devServer: {
    // We want the dev server inlined into the bundle for us
    inline: true,
    // Set the log level to only show us errors.
    // Other options are: none, minimal, normal, verbose
    stats: 'errors-only'
  }
};
