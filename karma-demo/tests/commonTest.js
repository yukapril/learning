describe("common.js", function () {
    it("add", function () {
        var r1 = _.add(3, 4);
        expect(r1).toBe(7);
        var r2 = _.add('1', '2');
        expect(r2).toBe(0);
    });

    it("isArray", function () {
        var r1 = _.isArray([]);
        expect(r1).toBe(true);
        var arg = function () { return arguments } ();
        var r2 = _.isArray(arg);
        expect(r2).toBe(false);
    });
});