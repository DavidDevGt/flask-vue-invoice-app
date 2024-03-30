<template>
    <div class="container my-5">
        <form @submit.prevent="login" class="card p-4 shadow">
            <div class="mb-3">
                <label for="username" class="form-label">Nombre de Usuario</label>
                <input id="username" v-model="username" type="text" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Contraseña</label>
                <input id="password" v-model="password" type="password" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary">Iniciar sesión</button>
        </form>
    </div>
</template>

<script>
import Swal from 'sweetalert2';

export default {
    data() {
        return {
            username: '',
            password: '',
        };
    },
    methods: {
        async login() {
            // Aquí implementarías la lógica para verificar las credenciales contra el backend
            try {
                // Simula una petición al backend
                await new Promise((resolve, reject) => setTimeout(() => {
                    const mockResponse = this.username === 'admin' && this.password === 'admin'; // Cambia esto por la lógica real de autenticación
                    mockResponse ? resolve() : reject();
                }, 500));

                this.$router.push("/dashboard");
                Swal.fire('¡Éxito!', 'Has iniciado sesión correctamente.', 'success');
            } catch (error) {
                Swal.fire('Error', 'Usuario o contraseña incorrectos.', 'error');
            }
        },
    },
};
</script>
