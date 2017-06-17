var Number = {};

Number.add = (x, y) => {
    return x + y;
};

Number.avg = (x, y) => {
    return (x + y) / 2;
};

var StringUitls = {};
StringUitls.contains = (x, y) => {
    return x.indexOf(y) >= 0;
};

export { Number, StringUitls };
