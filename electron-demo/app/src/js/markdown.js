let markdown = (text) => {
    var converter = new showdown.Converter();
    return converter.makeHtml(text);
};

const input = document.getElementById('J_Input');
const preview = document.getElementById('J_Privew');

input.addEventListener('input', function () {
    let text = this.value,
        html = markdown(text);
    preview.innerHTML = html;
}, false);