<template>
    <div class="container py-5">
        <div class="product-search">
            <div class="search-options mb-3">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Buscar producto" aria-label="Buscar producto">
                    <button class="btn btn-outline-secondary" type="button">Buscar</button>
                </div>
                <div class="row g-3">
                    <div class="col-md">
                        <select class="form-select" aria-label="Categoría">
                            <option selected>Todas las categorías</option>
                        </select>
                    </div>
                    <div class="col-md">
                        <select class="form-select" aria-label="Subcategoría">
                            <option selected>Todas las subcategorías</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>


<script setup>

</script>

<style scoped>
</style>