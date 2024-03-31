<template>
    <div class="dashboard-view container">
        <h1 class="my-4">Dashboard</h1>
        <div class="row">
            <!-- Tarjetas de Resumen Numérico -->
            <!-- <div class="col-md-3" v-for="summary in numericSummaries" :key="summary.title">
                <NumericSummary :title="summary.title" :value="summary.value" :bgColor="summary.bgColor" />
            </div> -->
            <!-- Calendario y Gráfico -->
            <div class="col-md-6">
                <SalesChartWidget />
            </div>
            <div class="col-md-6">
                <CalendarWidget />
            </div>
            <!-- Tarjetas de Información -->
            <!-- <div class="col-md-4" v-for="info in infoCards" :key="info.title">
                <InfoCard :header="info.header" :title="info.title" :text="info.text" :bgColor="info.bgColor" />
            </div> -->
        </div>
    </div>
</template>

<script>
import NumericSummary from '@/components/dashboard/NumericSummary.vue';
import CalendarWidget from '@/components/calendar/CalendarWidget.vue';
import SalesChartWidget from '@/components/dashboard/SalesChartWidget.vue';
import InfoCard from '@/components/dashboard/InfoCard.vue';

export default {
    components: {
        NumericSummary,
        CalendarWidget,
        SalesChartWidget,
        InfoCard,
    },
    data() {
        return {
            numericSummaries: [
                { title: 'Balance', value: 'Q7,427', bgColor: 'bg-red' },
                // ...otros resúmenes numéricos
            ],
            infoCards: [
                { header: 'Clientes', title: '9', text: 'Más información', bgColor: 'bg-yellow' },
                // ...otras tarjetas de información
            ],
        };
    },
};
</script>

<style scoped></style>