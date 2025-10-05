const { contextBridge, ipcRenderer } = require('electron');

// 向渲染进程暴露安全的API
contextBridge.exposeInMainWorld('electronAPI', {
    // 选择文件
    selectFile: () => ipcRenderer.invoke('select-file'),
    // 选择文件夹
    selectFolder: () => ipcRenderer.invoke('select-folder'),
    // 上传文件或文件夹
    upload: (params) => ipcRenderer.invoke('upload', params),
    // 检查路径是否存在
    checkPathExists: (path) => ipcRenderer.invoke('check-path-exists', path),
    // 上传多个文件夹(压缩后)
    uploadMultipleFolders: (params) => ipcRenderer.invoke('upload-multiple-folders', params),
    // 监听上传进度
    onUploadProgress: (callback) => ipcRenderer.on('upload-progress', (event, progress) => callback(progress)),
    // 移除上传进度监听
    removeUploadProgressListener: () => ipcRenderer.removeAllListeners('upload-progress'),
    // 环境配置相关API
    getEnvironmentConfig: () => ipcRenderer.invoke('get-environment-config'),
    saveEnvironmentConfig: (config) => ipcRenderer.invoke('save-environment-config', config),
    saveLastUploadConfig: (config) => ipcRenderer.invoke('save-last-upload-config', config)
});