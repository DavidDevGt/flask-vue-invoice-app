<template>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
      <router-link class="navbar-brand" to="/">{{ empresa }}</router-link>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <router-link class="nav-link active" aria-current="page" to="/">Inicio</router-link>
          </li>
          <li class="nav-item dropdown" :class="{ show: isOpen }">
            <a class="nav-link dropdown-toggle" href="#" @click="toggleDropdown" aria-expanded="isOpen">
              Módulo Padre
            </a>
            <ul class="dropdown-menu" :class="{ show: isOpen }">
              <li><router-link class="dropdown-item" to="/submodulo1">Submódulo 1</router-link></li>
              <li><router-link class="dropdown-item" to="/submodulo2">Submódulo 2</router-link></li>
              <li><router-link class="dropdown-item" to="/submodulo3">Submódulo 3</router-link></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</template>

<script>
export default {
  name: 'Navbar',
  data() {
    return {
      isOpen: false,
      "empresa": "Ferreteria Dismafer"
    };
  },
  methods: {
    toggleDropdown() {
      this.isOpen = !this.isOpen;
    }
  }
};
</script>

<style scoped></style>
