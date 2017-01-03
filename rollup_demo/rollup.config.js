import babel from 'rollup-plugin-babel';

export default {
    entry: './src/main.js',
    format: 'umd',
    moduleName: 'Util',
    plugins: [babel()],
    banner: `
/**
 * This is a banner!
 * makes any better!
 */`,
    dest: './build/bundle.js'
};