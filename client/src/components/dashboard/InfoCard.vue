<template>
    <div :class="`card info-card text-white mb-3 ${bgColor}`" style="max-width: 18rem;">
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

<style scoped>
.card.info-card {
    max-width: 100%;
    border-radius: 10px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    font-size: 1.25em;
}
</style>