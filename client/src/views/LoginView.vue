<template>
    <div class="login-container text-center">
        <h1 class="fw-bold mb-4">{{ empresa }}</h1>
        <LoginForm @login="handleLogin" />
    </div>
</template>

<script>
import { useAuthStore } from "@/store/auth";
import LoginForm from "@/components/auth/LoginForm.vue";
import Swal from 'sweetalert2';

export default {
    components: {
        LoginForm,
    },
    data() {
        return {
            'empresa': 'Ferreteria Dismafer',
        }
    },
    setup() {
        const authStore = useAuthStore();

        const handleLogin = async (credentials) => {
            try {
                await new Promise((resolve, reject) => setTimeout(() => {
                    const mockResponse = credentials.username === 'admin' && credentials.password === 'admin'; // Ejemplo admin admin
                    mockResponse ? resolve() : reject(new Error("Credenciales incorrectas"));
                }, 500));

                authStore.login();
                this.$router.push("/dashboard");
                Swal.fire('¡Bienvenido!', 'Has iniciado sesión correctamente.', 'success'); // mensaje de éxito
            } catch (error) {
                Swal.fire('Error', error.message, 'error'); // mensaje de error
            }
        };

        return { handleLogin };
    },
};
</script>

<style scoped>
.login-container {
    max-width: 420px;
    margin: 40px auto;
    padding: 20px;
}
</style>