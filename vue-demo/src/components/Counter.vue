<template>
    <div class="block counter">
        <p class="count">库存: <span>{{total}}</span></p>

        <div>
            <p>库房管理</p>
            <button @click="increment(10)">增加10件</button>
            <button @click="decrement(10)">移走10件</button>
        </div>
        <div>
            <p>收银台</p>
            <button @click="decrement()">售出1件</button>
        </div>
        <div>
            <p>服务台</p>
            <button @click="increment()">退回1件</button>
        </div>
    </div>
</template>

<script>
    export default {
        name: 'Counter',
        computed: {
            total() {
                return this.$store.state.total
            }
        },
        methods: {
            increment(n = 1) {
                this.$store.commit('increment', { num: n })
            },
            decrement(n = 1) {
                this.$store.commit('decrement', { num: n })
            }
        }
    }
</script>
<style>
    .counter .count{
        font-size: 1.5rem;
    }
    .counter .count span {
        font-weight: 900;
    }
    .counter button{
        margin: 0 .5rem;
        padding: .4rem 1rem;
    }
</style>