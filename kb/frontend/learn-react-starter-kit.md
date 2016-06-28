# React Starter Kit 框架代码解读

## 概述

RSK框架是目前yeoman上使用人数最多的react脚手架。本文主要从应用启动开始，顺藤摸瓜解读框架的代码，帮助读者理解整个框架的运作流程。

## 启动

使用RSK生成的的项目，其启动命令是`npm start`。因此，我们从此命令开始解读整个应用的代码。

### npm start
`npm start` 定义在`package.json`文件中：
`"start": "babel-node tools/run start"`

这个命令使用babel-node 代替 node 执行了 tools/run.js 程序。

### tools/run

此程序运行一些特定的任务，同时显示任务执行情况，例如时间等。
`babel-node tools/run start`即运行tools目录下的`start`任务。

### tools/start.js

此任务用于启动一个开发服务器。其主要流程包括：
1. 运行clean任务，清空build文件夹
2. 运行copy任务，拷贝需要的文件
3. 使用webpack启动一个Hot服务器，真实的服务器由`runServer`启动

```

// 当命令行中包含‘--release’时，此应用为production模式
const DEBUG = !process.argv.includes('--release');

async function start() {

  ...

  await new Promise(resolve => {

    // 选择clientConfig配置，
    // 关于webpack配置文件的target属性：https://webpack.github.io/docs/configuration.html#target
    webpackConfig.filter(x => x.target !== 'node').forEach(config => {
      // 当前选中的config是clientConfig
      // config.entry的原值是'./client.js'
      // 关于webpack-hot-middleware的配置与使用：https://github.com/glenjamin/webpack-hot-middleware
      config.entry = ['webpack-hot-middleware/client'].concat(config.entry);
      ...
    });

    const bundler = webpack(webpackConfig);
    ...
    let handleServerBundleComplete = () => {
      runServer((err, host) => {
        ...
        }
      });
    };

    bundler.plugin('done', () => handleServerBundleComplete());
  });
}

export default start;
```


### runServer
```
...
let server;
// 当前配置：serverConfig
const { output } = webpackConfig.find(x => x.target === 'node');
// serverPath: build/server.js
const serverPath = path.join(output.path, output.filename);

// Launch or restart the Node.js server
function runServer(cb) {
  ...
  // 使用 node server.js 启动服务器
  server = cp.spawn('node', [serverPath], {
    env: Object.assign({ NODE_ENV: 'development' }, process.env),
    silent: false,
  });
  ...
}


export default runServer;
```

### server.js
