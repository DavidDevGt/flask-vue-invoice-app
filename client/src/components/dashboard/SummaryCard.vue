<template>
    <div class="card text-white bg-primary mb-3" style="max-width: 18rem;">
        <div class="card-header">{{ title }}</div>
        <div class="card-body">
            <h5 class="card-title">{{ value }}</h5>
            <p class="card-text">{{ description }}</p>
        </div>
    </div>
</template>

<script>
export default {
    props: {
        title: String,
        value: String,
        description: String,
        bgColor: {
            type: String,
            default: 'bg-primary'
        }
    }
};
</script>

<style scoped>
.card {
    cursor: pointer;
    transition: transform 0.1s ease-in-out;
}

.card:hover {
    transform: scale(1.05);
}
</style>