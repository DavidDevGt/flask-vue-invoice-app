<template>
    <div class="dashboard-view container">
        <h1 class="my-4">Dashboard</h1>
        <div class="row">

            <div class="col-md-6">
                <SalesChartWidget />
            </div>
            <div class="col-md-6">
                <CalendarWidget />
            </div>

        </div>
    </div>
</template>

<script>
import CalendarWidget from '@/components/calendar/CalendarWidget.vue';
import SalesChartWidget from '@/components/dashboard/SalesChartWidget.vue';

export default {
    components: {
        CalendarWidget,
        SalesChartWidget,
    },
    data() {
        return {
        };
    },
};
</script>

<style scoped></style>