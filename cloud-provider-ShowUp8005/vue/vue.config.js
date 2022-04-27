 // 跨域配置
 const Timestamp = new Date().getTime();
 const name = "vue-demo";
module.exports = {
    publicPath: '/',
    devServer: {                //记住，别写错了devServer//设置本地默认端口  选填
        port: 8080,
        proxy: {                 //设置代理，必须填
            '': {              //设置拦截器  拦截器格式   斜杠+拦截器名字，名字可以自己定
                target: 'http://localhost:8005',     //代理的目标地址
                changeOrigin: true,              //是否设置同源，输入是的
                // pathRewrite: {                   //路径重写
                //     '/api': ''                     //选择忽略拦截器里面的单词
                // }
            }
        }
    },

    configureWebpack: {
        name: name,
        output: {
            // 输出重构  打包编译后的 文件名称  【模块名称.版本号.时间戳】
            filename: `js/[name].${Timestamp}.js`,
            chunkFilename: `js/[name].${Timestamp}.js`
        },
    }
}
