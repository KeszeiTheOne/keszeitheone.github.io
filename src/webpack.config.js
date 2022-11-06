const path = require('path');
const TerserPlugin = require("terser-webpack-plugin");
const webpack = require("webpack");
const {ProvidePlugin} = require("webpack");

module.exports = {
	mode: 'development',
	entry: {
		main: './main.js',
	},
	output: {
		filename: '[name]-build.js',
		path: path.resolve(__dirname, 'dist/js'),
		chunkFilename: '[name].[chunkhash].js'
	},
	module: {
		rules: [
			{
				test: /\.js$/,
				exclude: /node_modules/,
				use: {
					loader: "babel-loader",
				},
			}
		],
	},
	resolve: {
		alias: {
			js: path.resolve(__dirname, 'js/'),
			vendor: path.resolve(__dirname, 'node_modules/'),
		},
		extensions: ["*", ".js", ".vue", ".json"],
	},
	optimization: {
		chunkIds: false,
		minimizer: [new TerserPlugin({
			extractComments: false,
		})],
	},
	plugins: [
		new webpack.ids.DeterministicChunkIdsPlugin({
			maxLength: 5,
		}),
		new ProvidePlugin({
			'_': 'underscore',
			'$':'jquery',
			'jQuery':'jquery'
		}),
	]
};
