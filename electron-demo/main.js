'use strict';
const {app, BrowserWindow, Menu, dialog} = require('electron');


const common = {
    progressBar(d){
        mainWindow.setProgressBar(d);
    }
};

let menu = {
    template: [
        {
            label: 'Demo',
            submenu: [
                {
                    label: 'Alert Test',
                    accelerator: 'CmdOrCtrl+Alt+1',
                    click () {
                        menu.messageBoxTest();
                    }
                },
                {
                    label: 'ProgressBar Test',
                    accelerator: 'CmdOrCtrl+Alt+2',
                    click () {
                        menu.progressTest();
                    }
                }
            ]
        },
        {
            label: 'Pages',
            submenu: [
                {
                    label: 'First Page',
                    accelerator: 'CmdOrCtrl+Shift+1',
                    click () {
                        mainWindow.loadURL(`file://${__dirname}/app/index.html`);
                    }
                },
                {
                    label: 'Markdown',
                    accelerator: 'CmdOrCtrl+Shift+2',
                    click () {
                        mainWindow.loadURL(`file://${__dirname}/app/markdown.html`);
                    }
                }
            ]
        },
        {
            label: 'DevTools',
            submenu: [
                {
                    label: 'toggle',
                    accelerator: 'CmdOrCtrl+Alt+i',
                    click () {
                        mainWindow.webContents.toggleDevTools();
                    }
                }
            ]
        }
    ],
    progressTest(){
        let v = 0.0;
        let interval = setInterval(()=> {
            if (v < 1.0) {
                v += 0.02;
                v = +v.toFixed(2);
            } else {
                clearInterval(interval);
                v = -1;
            }
            common.progressBar(v);
        }, 100);
    },
    messageBoxTest(){
        let v = dialog.showMessageBox(mainWindow, {
            type: 'none',
            buttons: ['OK', 'Cancel', 'Other'],
            defaultId: 0,
            cancelId: 1,
            title: 'dialog show',
            message: 'press any key...',
            detail: 'then, show the button id which you press.'
        });

        dialog.showMessageBox(mainWindow, {
            type: 'none',
            buttons: ['OK'],
            defaultId: 0,
            title: 'dialog show',
            message: 'you pressed button id is:',
            detail: v.toString()
        });

    },
    init(){
        let menu = Menu.buildFromTemplate(this.template);
        Menu.setApplicationMenu(menu);
    }
};

let mainWindow;
let subWindow;

let main = {
    mainWindow(){
        mainWindow = new BrowserWindow({
            title: 'Electron',
            width: 1000,
            height: 700,
            resizable: true,
            backgroundColor: '#fff',
            defaultFontFamily: 'Microsoft YaHei',
            defaultEncoding: 'utf-8',
            frame: true,
            icon: `${__dirname}/app/src/img/app.ico`
        });
        mainWindow.loadURL(`file://${__dirname}/app/index.html`);
    },
    subWindow(){
        subWindow = new BrowserWindow({
            parent: mainWindow,
            title: 'Electron',
            width: 500,
            height: 400,
            resizable: true,
            backgroundColor: '#fff',
            defaultFontFamily: 'Microsoft YaHei',
            defaultEncoding: 'utf-8',
            frame: true
        });
        subWindow.loadURL(`file://${__dirname}/app/markdown.html`);
    },
    init(){
        this.mainWindow();
        //this.subWindow();
    }
};


app.on('ready', ()=> {
    main.init();
    menu.init();
});
