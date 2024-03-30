<template>
    <div class="dashboard-widget card">
        <h5 class="card-header">Pedidos Recientes</h5>
        <ul class="list-group list-group-flush">
            <li class="list-group-item" v-for="pedido in pedidosRecientes" :key="pedido.id">
                Pedido #{{ pedido.id }} - {{ pedido.fecha }} - {{ pedido.cliente }}
            </li>
        </ul>
    </div>
</template>

<script>
export default {
    data() {
        return {
            pedidosRecientes: [
                { id: 1, fecha: '2023-03-30', cliente: 'Chanchito Feliz' },
                { id: 2, fecha: '2023-03-29', cliente: 'Chanchito Feliz' },
            ],
        };
    },
};
</script>

<style scoped>
.dashboard-widget {
    margin-bottom: 20px;
}
</style>