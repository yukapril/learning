const {remote} = require('electron');
const fs = require('fs');
const execFile = require('child_process').execFile;

const FileTypeHeader = {
    '25504446': 'PDF file',
    '4C00000001140200': 'Windows shortcut file',
    '504B030414000600':'MS Office 2007 documents',
    '526172211A0700':'WinRAR compressed archive'
};

const CheckFileType = (header)=> {
    header = header.toLowerCase();
    for (let chars in FileTypeHeader) {
        if (header.indexOf(chars.toLowerCase()) == 0) {
            return FileTypeHeader[chars];
        }
    }
    return '-';
};


let main = {
    drag(){
        const elFile = document.getElementById('J_FileSelect');
        const elFilePath = document.getElementById('J_FilePath');
        const elFileData = document.getElementById('J_FileData');
        const elFileSize = document.getElementById('J_FileSize');
        const elFileType = document.getElementById('J_FileType');
        elFile.ondragover = () => {
            return false;
        };
        elFile.ondragleave = elFile.ondragend = () => {
            return false;
        };
        elFile.ondrop = (e) => {
            e.preventDefault();
            let file = e.dataTransfer.files[0];
            elFilePath.textContent = file.path;
            elFileSize.textContent = file.size;
            elFileType.textContent = file.type || '-';
            fs.readFile(file.path, 'utf8', function (err, data) {
                let newData = data.substring(0, 1024);
                elFileData.textContent = newData;
            });


            fs.readFile(file.path, function (err, data) {
                let header = '';
                for (let i = 0; i < 8; i++) {
                    let c = data[i].toString(16);
                    if (c < 10) c = '0' + c;
                    header += c;
                }
                console.log(header);
                elFileType.textContent += ' (' + CheckFileType(header) + ')';
            });
            return false;
        };
    },
    exec(){
        const elNode = document.getElementById('J_ExecNode');
        execFile('node', ['-v'], (error, stdout, stderr) => {
            if (error) {
                throw error;
            }
            elNode.innerHTML = stdout;
        });
    },

    init(){
        this.drag();
        this.exec();
    }
};

main.init();