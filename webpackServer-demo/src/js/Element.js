class Element {
    constructor(querySelector) {
        this.querySelector = querySelector;
        this.el = document.querySelector(this.querySelector);
    }

    text(text) {
        this.el.innerText = text;
    }

    html(html) {
        this.el.innerText = html;
    }
}

export default Element;