<template>
    <FullCalendar :options="calendarOptions" />
</template>

<script>
import FullCalendar from '@fullcalendar/vue3';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';

export default {
    components: {
        FullCalendar
    },
    data() {
        return {
            calendarOptions: {
                plugins: [dayGridPlugin, interactionPlugin],
                initialView: 'dayGridMonth',
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,dayGridWeek,dayGridDay'
                },
                events: [
                    { title: 'Evento 1', date: '2024-03-30' },
                    { title: 'Evento 2', date: '2024-04-02' },
                ],
            },
        };
    },
};
</script>

<style scoped>

</style>