<template>
    <div>
        <canvas ref="salesChart"></canvas>
    </div>
</template>

<script>
import { Chart, registerables } from 'chart.js';

export default {
    mounted() {
        Chart.register(...registerables);
        const ctx = this.$refs.salesChart.getContext('2d');
        const myChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['Enero', 'Febrero', 'Marzo', 'Abril'],
                datasets: [{
                    label: 'Ventas',
                    data: [5000, 4000, 3000, 5000],
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }],
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    }
};
</script>

<style scoped>
</style>