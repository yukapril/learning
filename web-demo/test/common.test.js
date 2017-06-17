import { Number, StringUitls } from '../src/js/common.js';
import { expect } from 'chai';

describe('加法函数的测试', function() {
    it('1 加 1 应该等于 2', function() {
        expect(Number.add(1, 1)).to.be.equal(2);
    });
    it('1 加 4 应该等于 5', function() {
        expect(Number.add(1, 4)).to.be.equal(5);
    });
});
describe('平均数函数的测试', function() {
    it('1 和 1 平均值为 1', function() {
        expect(Number.avg(1, 1)).to.be.equal(1);
    });
    it('1 加 4 平均值为 2.5', function() {
        expect(Number.avg(1, 4)).to.be.equal(2.5);
    });
});
describe('包含函数的测试', function() {
    it('abc 中应该包含 b', function() {
        expect(StringUitls.contains('abc', 'b')).to.be.ok;
    });
    it('aaa 中不应该包含 b', function() {
        expect(StringUitls.contains('aaa', 'b')).not.to.be.ok;
    });
});
