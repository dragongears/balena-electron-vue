# balena-electron-vue

A base [Vue](https://vuejs.org/) app that runs in the [Electron](https://electronjs.org/) environment for [Balena](https://www.balena.io)
Raspberry Pi deployment. It exposes the process.env environment variables and VUE_APP_* environment variables on the $env property of
each Vue component, removing 'VUE_APP_' from the beginning of Vue app environment variable names.

For development the VUE_APP_* environment variables are stored in an .env file (typically .env.local) and in production the
VUE_APP_* environment variables are in the Balena Cloud Environment Variables panel.

**The problem:** During development, Vue CLI 3 brings over the VUE_APP_* environment variables to process.env for the render process from
the .env* files but when deployed to production Vue CLI 3 doesn't bring over the VUE_APP_* environment variables from the
Balena device variables dashboard.

**The solution:** Since the VUE_APP_* environment variables are available in the main process (background.js), send a synchronous
message to the render process (main.js) with the environment variables.

Based on [balena-electron-vuecli3](https://github.com/Lurow/balena-electron-vuecli3)

## Project setup
```
yarn install
```

### Compiles and hot-reloads for development
```
yarn run serve
```

### Compiles and minifies for production
```
yarn run build
```

### Run your tests
```
yarn run test
```

### Lints and fixes files
```
yarn run lint
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).
