import { createRouter, createWebHistory } from "vue-router";
import LoginView from "../views/LoginView.vue";
import DashboardView from "../views/DashboardView.vue";
import InventoryView from "../views/InventoryView.vue";
import OrderView from "../views/OrderView.vue";

const routes = [
  {
    path: "/login",
    name: "login",
    component: LoginView,
    meta: { requiresAuth: false }
  },
  {
    path: "/dashboard",
    name: "dashboard",
    component: DashboardView,
    meta: { requiresAuth: true }
  },
  {
    path: "/inventory",
    name: "inventory",
    component: InventoryView,
    meta: { requiresAuth: true }
  },
  {
    path: "/orders",
    name: "orders",
    component: OrderView,
    meta: { requiresAuth: true }
  },
  { path: "/:catchAll(.*)", redirect: "/dashboard" }, // Redirecciona cualquier ruta no definida al dashboard
];

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes,
});

// Guardia de navegación para verificar la autenticación del usuario
router.beforeEach((to, from, next) => {
  const requiresAuth = to.meta.requiresAuth;
  // Aquí deberías verificar si el usuario está autenticado
  // Por ejemplo, comprobando si hay un token de usuario guardado
  // const isAuthenticated = localStorage.getItem("userToken");
  const isAuthenticated = '@!bA%cx0A@fd#5#$AfdSDSd$%2sF15';

  if (requiresAuth && !isAuthenticated) {
    next("/login");
  } else {
    next();
  }
});

export default router;
