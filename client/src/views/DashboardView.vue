<template>
    <div class="dashboard-view container">
        <h1 class="my-4">Dashboard</h1>
        <!-- Widgets del Dashboard -->
        <div class="row">
            <div class="col-md-6">
                <DashboardWidget />
            </div>
            <!-- Agregar más widgets según sea necesario -->
        </div>
    </div>
</template>

<script>
import DashboardWidget from '@/components/dashboard/DashboardWidget.vue';

export default {
    components: {
        DashboardWidget,
    },
};
</script>

<style scoped>
</style>