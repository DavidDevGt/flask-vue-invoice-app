<template>
    <div :class="`card info-card mb-3 ${bgColor}`" style="max-width: 18rem;">
        <div class="card-header">{{ header }}</div>
        <div class="card-body">
            <h5 class="card-title">{{ title }}</h5>
            <p class="card-text">{{ text }}</p>
        </div>
    </div>
</template>

<script>
export default {
    props: {
        header: String,
        title: String,
        text: String,
        bgColor: {
            type: String,
            default: 'bg-info'
        }
    }
};
</script>

<style scoped></style>