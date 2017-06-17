const $data = document.querySelector('#J_Data');
const $input = document.querySelector('#J_Input');
const $form = document.querySelector('#J_Form');
const socket = io.connect('ws://127.0.0.1:3001');

const appendList = (msg, type) => {
    let $div = document.createElement('div');
    $div.classList.add('msg');
    $div.classList.add('cf');
    let $subDiv = document.createElement('div');
    $subDiv.classList.add(type);
    $subDiv.innerText = msg;
    $div.appendChild($subDiv);
    $data.appendChild($div);
};

socket.on("message", function (res) {
    appendList(res, 'server');
});

$form.addEventListener('submit', () => {
    let val = $input.value;
    $input.value = '';
    appendList(val, 'client');
    socket.emit("message", val);
});