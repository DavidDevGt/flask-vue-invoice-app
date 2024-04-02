<template>
    <div class="dashboard-view container-fluid">
        <h1 class="my-4">Dashboard</h1>
        <div class="row">

            <!-- Tarjetas Informativas y Sumarios Numéricos -->
            <div class="col-lg-12 mb-4">
                <div class="info-cards row mb-4">
                    <div class="col-md-6" v-for="card in infoCards" :key="card.header">
                        <InfoCard :header="card.header" :title="card.title" :text="card.text" :bgColor="card.bgColor"
                            class="shadow-sm rounded" />
                    </div>
                </div>
                <div class="numeric-summaries row">
                    <div class="col-md-6" v-for="summary in numericSummaries" :key="summary.title">
                        <NumericSummary :title="summary.title" :value="summary.value" :bgColor="summary.bgColor"
                            class="shadow-sm rounded mb-3" />
                    </div>
                </div>
            </div>

            <!-- Widgets de Gráfico de Ventas y Calendario -->
            <div class="col-lg-12 mb-4">
                <SalesChartWidget class="mb-5 p-3 shadow-sm rounded" />
                <CalendarWidget class="shadow-sm p-3 rounded" />
            </div>
        </div>
    </div>
</template>


<script>
import CalendarWidget from '@/components/calendar/CalendarWidget.vue';
import SalesChartWidget from '@/components/dashboard/SalesChartWidget.vue';
import InfoCard from '@/components/dashboard/InfoCard.vue';
import NumericSummary from '@/components/dashboard/NumericSummary.vue';

export default {
    components: {
        CalendarWidget,
        SalesChartWidget,
        InfoCard,
        NumericSummary,
    },
    data() {
        return {
            infoCards: [
                { header: 'Usuarios Activos', title: 'Total de Usuarios', text: '320', bgColor: 'bg-primary' },
                { header: 'Facturas Recientes', title: 'Últimas Facturas', text: '45', bgColor: 'bg-success' },
                { header: 'Pedidos en Proceso', title: 'Total de Pedidos', text: '67', bgColor: 'bg-warning' },
                { header: 'Bajo Inventario', title: 'Artículos Críticos', text: '12', bgColor: 'bg-danger' }
            ],
            numericSummaries: [
                { title: 'Ventas del Mes', value: 'Q18,400', bgColor: 'bg-info' },
                { title: 'Clientes Nuevos', value: '27', bgColor: 'bg-primary' },
                { title: 'Ingresos Recientes', value: '14', bgColor: 'bg-success' },
                { title: 'Egresos Recientes', value: '9', bgColor: 'bg-danger' }
            ],
        };
    },
};
</script>

<style scoped></style>