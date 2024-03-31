<template>
    <div :class="`card text-white mb-3 ${bgColor}`" style="max-width: 18rem;">
        <div class="card-header">{{ title }}</div>
        <div class="card-body">
            <h5 class="card-title">{{ value }}</h5>
        </div>
    </div>
</template>

<script>
export default {
    props: {
        title: String,
        value: String,
        bgColor: String
    }
};
</script>

<style scoped>
</style>