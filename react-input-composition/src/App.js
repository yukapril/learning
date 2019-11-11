import React from 'react';

class App extends React.PureComponent {
  state = {
    text: "",
    isInputing: false
  };

  // 原本只有使用输入法输入时候会触发，
  // event.type 主要为 compositionEvent 系列。
  // 在 handleChange 中调用此方法后，
  // event.type 就存在 change 的情况。
  handleCompsition = event => {
    const { isInputing } = this.state;
    const type = event.type;
    const value = event.target.value;
    console.log("handleCompsition", type, value);

    if (type === "compositionstart") {
      // 输入法开始输入
      this.setState({ isInputing: true });
    } else if (type === "compositionupdate") {
      // 输入法每次敲击，这里不需要特殊处理
      // 只需要关注开始和结束事件即可
    } else if (type === "compositionend") {
      // 输入法结束输入
      this.setState({ isInputing: false });
      // 由于是先调用 onChange
      // 最后调用 compositionend
      // 故此事件内需要将最终的内容写入 state
      this.setState({ text: value });
    } else if (type === "change") {
      if (!isInputing) {
        // 非输入法情况下，直接保存内容到 state
        this.setState({ text: value });
      } else {
        // 输入法情况下，等待输入法输入完毕
        // 然后在 compositionend 事件内，再保存内容到 state
        // 故此处不需要保存内容到 state
      }
    }
  };

  // 不论如何输入都会触发 handleChange
  // 但是直接输入英文，不会触发 handleCompsition
  // 故干脆都放到 handleCompsition 处理
  handleChange = event => {
    console.log("handleChange");
    // 必须透传 event 事件
    // 主要是透传 event.type === 'change' 这种情况
    this.handleCompsition(event);
  };

  render () {
    const { text, isInputing } = this.state;

    return (
      <div>
        <p>输入状态：{isInputing ? "输入法输入中..." : "-"}</p>
        <p>输入内容：{text}</p>
        <p>
          输入区域：
          <input
            onCompositionStart={this.handleCompsition}
            onCompositionUpdate={this.handleCompsition}
            onCompositionEnd={this.handleCompsition}
            onChange={this.handleChange}
            value={this.state.innerInputText} />
        </p>
      </div>
    );
  }
}

export default App;